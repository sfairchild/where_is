# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :where_is, WhereIs.Repo,
  database: "where_is_repo",
  username: "user",
  password: "pass",
  hostname: "localhost"

config :where_is, WhereIs.Repo,
  database: "where_is_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

# Configures the endpoint
config :where_is, WhereIsWeb.Endpoint,
  rooms_token: {:system, "ROOMS_TOKEN"},
  mattermost_token: {:system, "MATTERMOST_TOKEN"},
  url: [host: "localhost"],
  secret_key_base: "M3xpWXIv3aP5TMXnw2cPgbK/GDUGzLgeqgTidk7FNCjbmtJIpPsGKk3OKnuHhetJ",
  render_errors: [view: WhereIsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WhereIs.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "SECRET_SALT"
  ]

config :where_is, ecto_repos: [WhereIs.Repo]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# This file is purposely left out of git, you will need to create your own ./config/ueberauth.exs.
# You can use ueberauth.sample.exs as an example and insert your own oauth keys.
import_config "ueberauth.exs"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
