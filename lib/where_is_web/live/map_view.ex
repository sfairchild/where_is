defmodule WhereIsWeb.MapLive do

  use Phoenix.LiveView

  alias WhereIs.{ Repo, Map, Template }

  def render(assigns) do
    WhereIsWeb.PageView.render("map.html", assigns)
  end

  defmodule SubjectBase do
    defstruct name: nil, email: nil, id: nil, username: nil, status: nil, attributes: nil
  end

  def mount(%{"csrf_token" => csrf_token}, socket) do
    WhereIsWeb.Endpoint.subscribe("rooms")

    suggestions = [
      "Harry Potter", "Ron Weasley", "Hermione Granger",
      "Professor Snack", "Gandalf", "The Dudleys", "Mr. Filch",
    ]
    socket = socket
      |> assign(:titleName, "Randy")
      |> assign(:search_value, nil)
      |> assign(:subject, %SubjectBase{})
      |> assign(:maps, Repo.all(Map))
      |> assign(:active_map, Repo.get_by(Map, name: "mdc-north") |> Repo.preload([:template, locations: [:template, :user]]))
      |> assign(:templates, Repo.all(Template))
      |> assign(:suggestions, suggestions)
      |> assign(:svg, WhereIs.Svg.generate_svg)
      |> assign(:rooms, %{})
      |> assign(:csrf_token, csrf_token)
    {:ok, socket}
  end

  def handle_info(%Phoenix.Socket.Broadcast{event: "updated", topic: "rooms"}, socket) do
    socket = socket |> assign(:svg, WhereIs.Svg.generate_svg)

    {:noreply, socket}
  end

  def format_subject(%WhereIs.Room{} = room) do
    %{
      name: room.name,
      email: room.email,
      id: nil,
      username: nil,
      status: room.status,
      attributes: nil,
    }
  end

  def format_subject(%WhereIs.Locations{} = location) do
    %{
      name: location.name,
      email: nil,
      id: nil,
      username: nil,
      status: nil,
      attributes: location.attributes,
    }
  end

  def format_subject(%WhereIs.MattermostUser{} = user) do
    name =
      if (user.first_name !== "" && user.first_name !== nil), do: "#{user.first_name} #{user.last_name}",
      else: user.username

    %{
      name: name,
      email: user.email,
      id: user.location_id,
      username: user.username,
      status: nil,
      attributes: nil,
    }
  end

  def handle_event("search", %{"search" => value}, socket) do
    suggestions = WhereIs.Fuzzy.find(value)
      |> Enum.map(fn(s) -> format_subject(s) end)

    [head | _tail] = suggestions

    subject = if (value !== ""), do: head,
    else: %SubjectBase{}

    socket = socket
      |> assign(:search_value, value)
      |> assign(:suggestions, suggestions)
      |> assign(:subject, subject)

    {:noreply, socket}
  end

  def handle_event("change-map", %{"name" => value}, socket) do
    map = Repo.get_by(Map, name: "mdc-north")
          |> Repo.preload([:template, locations: [:template, :user]])
    {:noreply, assign(socket, :active_map, map)}
  end
end
