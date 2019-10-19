defmodule WhereIsWeb.MapLive do
  use Phoenix.LiveView

  def render(assigns) do
    WhereIsWeb.PageView.render("map.html", assigns)
  end

  def mount(_session, socket) do
    message = "Hello from the view"
    {:ok, assign(socket, :welcome, message)}
  end

  def handle_event("search", %{"value" => value}, socket) do
    {:noreply, assign(socket, value: value)}
  end
end
