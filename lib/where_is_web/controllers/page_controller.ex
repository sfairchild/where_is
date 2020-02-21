defmodule WhereIsWeb.PageController do
  use WhereIsWeb, :controller
  alias Phoenix.LiveView

  def index(conn = %{assigns: %{current_user: %{}}}, _params) do
    LiveView.Controller.live_render(conn, WhereIsWeb.MapLive, session: %{"csrf_token" => Phoenix.Controller.get_csrf_token()})
  end

  def index(conn, _params) do
    render(conn, "login.html")
  end
end
