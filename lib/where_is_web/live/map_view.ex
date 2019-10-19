defmodule WhereIsWeb.MapLive do
  use Phoenix.LiveView

  def render(assigns) do
    WhereIsWeb.PageView.render("map.html", assigns)
  end

  def mount(_session, socket) do
    {:ok, assign(socket, :welcome, "Hello from the view")}
  end
end
