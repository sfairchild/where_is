use Mix.Config

config :ueberauth, Ueberauth,
  providers: [
    microsoft: {Ueberauth.Strategy.Microsoft, []},
  ]

config :ueberauth, Ueberauth.Strategy.Microsoft.OAuth,
  client_id: "insert your client id",
  client_secret: "insert your client secret",
  redirect_uri: "insert your app url",
  tenant_id: "insert your token",
  authorize_url: "https://login.microsoftonline.com/#{insert your token}/oauth2/v2.0/authorize"
