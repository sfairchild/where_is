defmodule WhereIsWeb.Router do
  use WhereIsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WhereIsWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api/users", WhereIsWeb do
    pipe_through :api

    get "/", FindController, :fetchMattermostUsers
  end

  # Other scopes may use custom stacks.
  scope "/api", WhereIsWeb.Api do
    pipe_through :api

    get "/", FindController, :index
  end
end
