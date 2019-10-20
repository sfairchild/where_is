defmodule WhereIs.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the endpoint when the application starts
      WhereIsWeb.Endpoint,
      # Starts a worker by calling: WhereIs.Worker.start_link(arg)
      # {WhereIs.Worker, arg},
       {WhereIs.Users, _args},
       {WhereIs.Room, _args}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WhereIs.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def validate("@bad_user"), do: false
  def validate(_), do: true

  def generate_url("bad_user"), do: nil
  def generate_url("frodo") do
    locationInfo = WhereIs.Locations.find_location(WhereIs.Locations.list, "North Desk 13")
    WhereIs.Svg.desk_zoom(locationInfo.x, locationInfo.y)
  end

  def generate_url(username) do
    [head | tail] = WhereIs.MattermostUser.fuzzy_search_users(username)
    #uses first response from fuzzy search to get location_id from the individual user.
    "https://nautical-sandy-americanbulldog.gigalixirapp.com/svg/map.svg?name=#{head.location_id}"
  end
  #def generate_url(_), do: link = "https://upload.wikimedia.org/wikipedia/commons/c/ca/Cthulhu_blood.png"



  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WhereIsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
