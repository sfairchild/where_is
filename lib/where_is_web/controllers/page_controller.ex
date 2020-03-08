defmodule WhereIsWeb.PageController do
  use WhereIsWeb, :controller
  alias Phoenix.LiveView

  alias WhereIs.User

  def index(conn = %{assigns: %{current_user: %User{} = current_user}}, _params) do
IO.inspect(current_user)
    LiveView.Controller.live_render(conn, WhereIsWeb.MapLive, session: %{"current_user" => current_user, "csrf_token" => Phoenix.Controller.get_csrf_token()})
  end

  def index(conn, _params) do
    render(conn, "login.html")
  end

  def healthy(conn, _params) do
    send_resp(conn, 200, "")
  end
end
