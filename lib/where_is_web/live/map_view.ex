defmodule WhereIsWeb.MapLive do
  use Phoenix.LiveView

  def render(assigns) do
    WhereIsWeb.PageView.render("map.html", assigns)
  end

  def mount(_session, socket) do
    socket = socket
    |> assign(:svg, WhereIs.Svg.generate_svg)
    {:ok, socket}
  end

  def handle_event("search", %{"value" => value}, socket) do
    {:noreply, assign(socket, value: value)}
  end
end
