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

    get "/test1", PageController, :test1

  end

  # Other scopes may use custom stacks.
  scope "/api", WhereIsWeb do
    pipe_through :api

    post "/", PageController, :index

    post "test1", PageController, :test1

  end
end
