
defmodule WhereIsWeb.MapLive do
  use Phoenix.LiveView

  def render(assigns) do
    WhereIsWeb.PageView.render("map.html", assigns)
  end

  defmodule User do
    defstruct name: "Roland Canuto", email: "rolandcanuto@outlook.com", username: "rolandc5", location: "North_Desk_21"
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
      |> assign(:user, %{first_name: nil, email: nil, username: nil, location_id: nil})
      |> assign(:map, "north")
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

  def handle_event("search", %{"search" => value}, socket) do
    suggestions = WhereIs.MattermostUser.fuzzy_search_users(value)
    [head | _tail] = suggestions

    socket = socket
      |> assign(:searchValue, value)
      |> assign(:suggestions, suggestions)
      |> assign(:user, head)

    {:noreply, socket}
    # {:noreply, assign(socket, searchValue: value)}
  end

  def handle_event("autosuggest", %{"name" => value}, socket) do
    socket = socket |> assign(:searchValue, value)
    # handle_event("search", %{"search" => value}, socket)
    {:noreply, socket}
  end

  def handle_event("change-map", %{"name" => value}, socket) do
    {:noreply, assign(socket, :map, value)}
  end

  def handle_event("getData", _, socket) do
    socket = socket |> assign(:user, %User{})
    {:noreply, socket}
  end
end
