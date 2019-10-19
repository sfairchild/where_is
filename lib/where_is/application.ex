defmodule WhereIs.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the endpoint when the application starts
      WhereIsWeb.Endpoint
      # Starts a worker by calling: WhereIs.Worker.start_link(arg)
      # {WhereIs.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WhereIs.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def validate(username) do
    true
  end

  def generateUrl(username) do 
    if username == "@sean" do
      link = "https://commons.wikimedia.org/wiki/File:Media_Viewer_Icon_-_Link_Hover.svg"
    else 
      link = "https://upload.wikimedia.org/wikipedia/commons/c/ca/Cthulhu_blood.png"
    end
  end

  

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WhereIsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
