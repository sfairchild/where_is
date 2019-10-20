
defmodule WhereIsWeb.MapLive do
  use Phoenix.LiveView

  def render(assigns) do
    WhereIsWeb.PageView.render("map.html", assigns)
  end

  defmodule User do
    defstruct name: "Roland Canuto", email: "rolandcanuto@outlook.com", username: "rolandc5", id: "North_Desk_21"
  end

  def mount(_session, socket) do
    suggestions = [
      "Harry Potter", "Ron Weasley", "Hermione Granger",
      "Professor Snack", "Gandalf", "The Dudleys", "Mr. Filch",
    ]

    socket = socket
      |> assign(:titleName, "Randy")
      |> assign(:searchValue, nil)
      |> assign(:name, nil)
      |> assign(:email, nil)
      |> assign(:username, nil)
      |> assign(:userData, nil)
      |> assign(:location, nil)
      |> assign(:map, "north")
      |> assign(:suggestions, suggestions)
      |> assign(:svg, WhereIs.Svg.generate_svg)
    {:ok, socket}
  end

  def handle_event("search", %{"search" => value}, socket) do
    {:noreply, assign(socket, :searchValue, value)}
  end

  def handle_event("autosuggest", %{"name" => value}, socket) do
    socket = socket
      |> assign(:searchValue, value)
    {:noreply, socket}
  end

  def handle_event("change-map", %{"name" => value}, socket) do
    {:noreply, assign(socket, :map, value)}
  end



  def handle_event("getData", _, socket) do
    user = %User{}
    location = user.id
    socket = socket
      |> assign(:location, location)
      |> assign(:name, user.name)
      |> assign(:email, user.email)
      |> assign(:username, user.username)
    {:noreply, socket}
  end


end
