defmodule WhereIsWeb.PageController do
  use WhereIsWeb, :controller
  alias Phoenix.LiveView


  def index(conn, _params) do
    LiveView.Controller.live_render(conn, WhereIsWeb.MapLive, session: %{})
  end

  # def handle_event("search", %{"value" => value}, socket) do
  #   {:noreply, assign(socket, :value, value)}
  # end

end
