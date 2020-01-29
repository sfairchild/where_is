defmodule WhereIsWeb.Auth do

  import Plug.Conn
  import Phoenix.Controller
  alias WhereIsWeb.Router.Helpers, as: Routes
  alias WhereIs.Accounts

  @site_admins ~w[

  ]

  def init(opts), do: opts

  def call(conn, _opts) do
    user_id = get_session(conn, :user_id)

    user = cond do
      assigned = conn.assigns[:current_user] -> assigned
      true -> Accounts.get_user_from_id(user_id)
    end

    put_current_user(conn, user)
  end

  def authenticate_admin(conn = %{assigns: %{admin_user: true}}, _), do: conn

  # not admin
  def authenticate_admin(conn = %{private: %{phoenix_format: "json"}}, _opts) do
    conn
    |> put_status(:unauthorized)
    |> halt()
    |> json(%{error: "unauthorized"})
  end

  def authenticate_admin(conn, _opts) do
    conn
    |> put_flash(:error, "You do not have access to that page")
    |> redirect(to: Routes.page_path(conn, :app))
    |> halt()
  end

  def logged_in_user(conn = %{assigns: %{currect_user: %{}}}), do: conn

  def logged_in_user(conn = %{private: %{phoenix_format: "json"}}) do
    conn
    |> put_status(:unauthorized)
    |> halt()
    |> json(%{error: "unauthorized"})
  end

  def logged_in_user(conn, _opts) do
    conn
    |> put_flash(:error, "You do not have access to that page")
    |> redirect(to: Routes.page_path(conn, :app))
    |> halt()
  end

  def put_current_user(conn, user) do
    token = user && WhereIs.Token.sign(%{id: user.id})

    conn
    |> assign(:current_user, user)
    |> assign(:user_token, token)
    # TODO update admin_user to use admin column from DB
    |> assign(:admin_user, (!!user && user.email) in @site_admins)
    |> put_session(:user_id, user && user.id)
    |> configure_session(renew: true)
    |> put_req_header("authorization", "Bearer #{token}")
  end

  def drop_current_user(conn) do
    conn
    |> delete_req_header("authorization")
    |> configure_session(drop: true)
  end
end
