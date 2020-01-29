defmodule WhereIsWeb.Router do
  use WhereIsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug WhereIsWeb.Auth
  end

  pipeline :svg do
    plug :accepts, ["svg"]
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/auth", WhereIsWeb do
    pipe_through([:browser])

    get("/:provider", AuthController, :request)
    get("/:provider/callback", AuthController, :callback)
    post("/:provider/callback", AuthController, :callback)
    delete("/logout", AuthController, :delete)
  end

  scope "/svg", WhereIsWeb do
    pipe_through :svg
    get "/map.svg", SvgController, :index
  end

  scope "/", WhereIsWeb do
    pipe_through :browser
    get "/", PageController, :index
  end


  # Other scopes may use custom stacks.
  scope "/api", WhereIsWeb.Api do
    pipe_through :api


    post "/", FindController, :index
    post "/user", FindController, :fetchUserFromMattermost
    post "/whereis", FindController, :find
  end

end
