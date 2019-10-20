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

    get "/*path", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", WhereIsWeb.Api do
    pipe_through :api


   post "/", FindController, :index

    # post "/", FindController, :index
    post "/users", FindController, :fetchCurrentMattermostUsers
    post "/whereis", FindController, :find
  end
end
