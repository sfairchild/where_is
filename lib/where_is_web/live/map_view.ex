
defmodule WhereIsWeb.MapLive do
  use Phoenix.LiveView

  def render(assigns) do
    WhereIsWeb.PageView.render("map.html", assigns)
  end

  def mount(_session, socket) do
    suggestions = [
      "Harry Potter", "Ron Weasley", "Hermione Granger",
      "Professor Snack", "Gandalf", "The Dudleys", "Mr. Filch",
    ]

    socket = socket
      |> assign(:titleName, "Randy")
      |> assign(:searchValue, "")
      |> assign(:svg, WhereIs.Svg.generate_svg)
      |> assign(:suggestions, suggestions)
    {:ok, socket}
  end

  def handle_event("search", %{"search" => value}, socket) do
    IO.puts(value)
    {:noreply, assign(socket, :searchValue, value)}
  end

  def handle_event("autosuggest", %{"name" => value}, socket) do
    socket = socket |> assign(:searchValue, value)
    {:noreply, socket}
  end
end
