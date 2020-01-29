defmodule WhereIsWeb.AuthController do
  use WhereIsWeb, :controller

  plug Ueberauth

  alias Ueberauth.Strategy.Helpers
  alias WhereIs.Accounts
  alias WhereIsWeb.Auth

  def delete(conn, _opt) do
    conn
    |> put_flash(:info, "You have been logged out")
    |> configure_session(drop: true)
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:error, "Failed to authenticate.")
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    with {:ok, user} <- UserFromAuth.find_or_create(auth),
         {:ok, user} <- Accounts.get_or_create_user(user) do
      conn
      |> put_flash(:info, "Successfully authenticated.")
      |> Auth.put_current_user(user)
      |> redirect(to: "/")
    else
      {:error, reason} ->
        conn
        |> put_flash(:error, reason)
        |> redirect(to: "/")
    end
  end

  def request(conn, _params) do
    render(conn, "request.html", callback_url: Helpers.callback_url(conn))
  end
end
