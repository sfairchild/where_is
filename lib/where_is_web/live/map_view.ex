
defmodule WhereIsWeb.MapLive do
  use Phoenix.LiveView

  def render(assigns) do
    WhereIsWeb.PageView.render("map.html", assigns)
  end

  defmodule SubjectBase do
    defstruct name: nil, email: nil, id: nil, username: nil, status: nil, attributes: nil
  end

  def mount(_session, socket) do
    WhereIsWeb.Endpoint.subscribe("rooms")

    suggestions = [
      "Harry Potter", "Ron Weasley", "Hermione Granger",
      "Professor Snack", "Gandalf", "The Dudleys", "Mr. Filch",
    ]

    socket = socket
      |> assign(:titleName, "Randy")
      |> assign(:searchValue, nil)
      |> assign(:subject, %SubjectBase{})
      |> assign(:map, "both")
      |> assign(:suggestions, suggestions)
      |> assign(:svg, WhereIs.Svg.generate_svg)
      |> assign(:rooms, %{})
    {:ok, socket}
  end

  def handle_info(%{event: "updated", topic: "rooms"}, socket) do
      socket = socket |> assign(:svg, WhereIs.Svg.generate_svg)

    {:noreply, socket}
  end

  def handle_info(a, b, socket) do


    IO.puts "RECEIVED CHANNEL"
    IO.inspect a
    IO.inspect b
    {:noreply, socket}
  end

  def formatSubject(%WhereIs.Room{} = room) do
    %{
      name: room.name,
      email: room.email,
      id: nil,
      username: nil,
      status: room.status,
      attributes: nil,
    }
  end

  def formatSubject(%WhereIs.Locations{} = location) do
    %{
      name: location.name,
      email: nil,
      id: nil,
      username: nil,
      status: nil,
      attributes: location.attributes,
    }
  end

  def formatSubject(%WhereIs.MattermostUser{} = user) do
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
      |> Enum.map(fn(s) -> formatSubject(s) end)

    [head | _tail] = suggestions

    subject = if (value !== ""), do: head,
    else: %SubjectBase{}

    socket = socket
      |> assign(:searchValue, value)
      |> assign(:suggestions, suggestions)
      |> assign(:subject, subject)

    {:noreply, socket}
  end

  def handle_event("change-map", %{"name" => value}, socket) do
    {:noreply, assign(socket, :map, value)}
  end
end
