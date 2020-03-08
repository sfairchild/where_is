defmodule WhereIsWeb.MapLive do

  use Phoenix.LiveView
  import Ecto.Query
  # alias LiveViewFormWeb.Router.Helpers, as: Routes

  alias WhereIs.{User, Repo, Map, Svg, Template, Location}

  def render(assigns) do
    WhereIsWeb.PageView.render("map.html", assigns)
  end

  defmodule SubjectBase do
    defstruct name: nil, email: nil, id: nil, username: nil, status: nil, attributes: nil
  end

  def mount(%{"csrf_token" => csrf_token, "current_user" => current_user}, socket) do
    WhereIsWeb.Endpoint.subscribe("rooms")

    suggestions = [
      "Harry Potter", "Ron Weasley", "Hermione Granger",
      "Professor Snack", "Gandalf", "The Dudleys", "Mr. Filch",
    ]
    active_map = Repo.get_by(Map, name: "mdc-north")
                 |> Repo.preload([template: :svg_elements, locations: [:template, :user]])

    socket = socket
             |> assign(:editing, false)
             |> assign(:current_user, current_user)
             |> assign(:admin_user, current_user.admin)
             |> assign(:templates, Repo.all(Template) |> Repo.preload(:svg_elements))
             |> assign(:maps, Repo.all(Map))
             |> assign(:active_map, active_map)
             |> assign(:locations, active_map.locations)
             |> assign(:selected_location, nil)

      |> assign(:search_value, nil)
      |> assign(:subject, %SubjectBase{})
      |> assign(:suggestions, suggestions)
      |> assign(:rooms, %{})
      |> assign(:csrf_token, csrf_token)
    {:ok, socket}
  end

  def handle_info(%Phoenix.Socket.Broadcast{event: "updated", topic: "rooms"}, socket) do

    {:noreply, socket}
  end

  def handle_event("search", %{"search" => value}, socket) do
    # suggestions = WhereIs.Fuzzy.find(value)
    #   |> Enum.map(fn(s) -> format_subject(s) end)

    # [head | _tail] = suggestions

    # subject = if (value !== ""), do: head,
    # else: %SubjectBase{}

    # socket = socket
    #   |> assign(:search_value, value)
    #   |> assign(:suggestions, suggestions)
    #   |> assign(:subject, subject)

    {:noreply, socket}
  end

  def handle_event("select-location", %{"location-id" => id}, %{assigns: %{selected_location: %{id: id}, active_map: map}} = socket) do
    locations = Repo.all(from l in Location, where: l.map_id == ^map.id)
                |> Repo.preload([:template, :user])
    {:noreply, assign(socket, %{selected_location: nil, locations: locations})}
  end

  def handle_event("select-location", %{"location-id" => id}, %{assigns: %{active_map: map}} = socket) do
    location = Repo.get(Location, id)
               |> Repo.preload([:template, :user])

    map = Repo.one(from m in Map,
      where: m.id == ^map.id,
      left_join: template in assoc(m, :template),
      where: m.template_id == template.id,
      left_join: location in assoc(m, :locations),
      where: location.id != ^id,
      left_join: loc_template in assoc(location, :template),
      left_join: user in assoc(location, :user),
      preload: [locations: {location, template: loc_template, user: user}, template: template]
    )

    {:noreply, assign(socket, %{selected_location: location, active_map: map, locations: map.locations})}
  end

  def handle_event("change-map", %{"id" => id}, socket) do
    map = Repo.get(Map, id)
          |> Repo.preload([template: :svg_elements, locations: [:template, :user]])
    {:noreply, assign(socket, %{active_map: map, locations: map.locations, selected_location: nil})}
  end

  def handle_event("change-page-state", %{}, socket = %{assigns: %{editing: true}}) do
    {:noreply, assign(socket, :editing, false)}
  end

  def handle_event("change-page-state", %{}, socket = %{assigns: %{admin_user: true, selected_location: location}}) do
    {:noreply, assign(socket, %{editing: true, changeset: %Location{} |> Location.changeset()})}
  end
  def handle_event("change-page-state", %{}, socket), do: {:noreply, socket}

  def handle_event("move_user", %{}, %{assigns: %{current_user: user, selected_location: selected_location, active_map: map}} = socket) do
    Repo.update(User.changeset(user, %{location_id: selected_location.id}))

    locations = Repo.all(from l in Location, where: l.map_id == ^map.id, where: l.id != ^selected_location.id)
                |> Repo.preload(:template)

    {:noreply, assign(socket, :locations, locations)}
  end

  def handle_event("move-location", %{"key" => "ArrowLeft", "shiftKey" => true}, %{assigns: %{selected_location: location}} = socket) do
    {:noreply, assign(socket, :selected_location, %Location{location | x_coordinate: location.x_coordinate - 5.0})}
  end
  def handle_event("move-location", %{"key" => "ArrowLeft"}, %{assigns: %{selected_location: location}} = socket) do
    {:noreply, assign(socket, :selected_location, %Location{location | x_coordinate: location.x_coordinate - 0.1})}
  end
  def handle_event("move-location", %{"key" => "ArrowRight", "shiftKey" => true}, %{assigns: %{selected_location: location}} = socket) do
    {:noreply, assign(socket, :selected_location, %Location{location | x_coordinate: location.x_coordinate + 5.0})}
  end
  def handle_event("move-location", %{"key" => "ArrowRight"}, %{assigns: %{selected_location: location}} = socket) do
    {:noreply, assign(socket, :selected_location, %Location{location | x_coordinate: location.x_coordinate + 0.1})}
  end
  def handle_event("move-location", %{"key" => "ArrowUp", "shiftKey" => true}, %{assigns: %{selected_location: location}} = socket) do
    {:noreply, assign(socket, :selected_location, %Location{location | y_coordinate: location.y_coordinate - 5.0})}
  end
  def handle_event("move-location", %{"key" => "ArrowUp"}, %{assigns: %{selected_location: location}} = socket) do
    {:noreply, assign(socket, :selected_location, %Location{location | y_coordinate: location.y_coordinate - 0.1})}
  end
  def handle_event("move-location", %{"key" => "ArrowDown", "shiftKey" => true}, %{assigns: %{selected_location: location}} = socket) do
    {:noreply, assign(socket, :selected_location, %Location{location | y_coordinate: location.y_coordinate + 5.0})}
  end
  def handle_event("move-location", %{"key" => "ArrowDown"}, %{assigns: %{selected_location: location}} = socket) do
    {:noreply, assign(socket, :selected_location, %Location{location | y_coordinate: location.y_coordinate + 0.1})}
  end
  def handle_event("move-location", %{"key" => "-"}, %{assigns: %{selected_location: location}} = socket) do
    IO.puts("SHRINK")
    scale = location.scale
            |> String.split(~r/\s+/)
            |> Enum.map(&Float.parse/1)
            |> Enum.map(fn {v, _} -> v end)
            |> Enum.map(&(&1 + 0.01))
            |> Enum.join(" ")
    {:noreply, assign(socket, :selected_location, %Location{location | scale: scale})}
  end
  def handle_event("move-location", %{"key" => "+"}, %{assigns: %{selected_location: location}} = socket) do
    scale = location.scale
            |> String.split(~r/\s+/)
            |> Enum.map(&Float.parse/1)
            |> Enum.map(fn {v, _} -> v end)
            |> Enum.map(&(&1 - 0.01))
            |> Enum.join(" ")
    {:noreply, assign(socket, :selected_location, %Location{location | scale: scale})}
  end
  def handle_event("move-location", %{"key" => "r"}, %{assigns: %{selected_location: location}} = socket) do
    [rotation | axis]= location.rotation
            |> String.split(~r/\s+/)
            |> Enum.map(&Float.parse/1)
            |> Enum.map(fn {v, _} -> v end)
    rotation = [rotation + 0.5 | axis]
               |> Enum.join(" ")
    {:noreply, assign(socket, :selected_location, %Location{location | rotation: rotation})}
  end
  def handle_event("move-location", %{"key" => "R"}, %{assigns: %{selected_location: location}} = socket) do
    [rotation | axis]= location.rotation
            |> String.split(~r/\s+/)
            |> Enum.map(&Float.parse/1)
            |> Enum.map(fn {v, _} -> v end)
    rotation = [rotation - 0.5 | axis]
               |> Enum.join(" ")
    {:noreply, assign(socket, :selected_location, %Location{location | rotation: rotation})}
  end

  def handle_event("move-location", params, socket) do
    {:noreply, socket}
  end

  def handle_event("add-location", _, socket) do

    {:noreply, socket}
  end
end
