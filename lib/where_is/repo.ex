defmodule WhereIs.Repo do
  use Ecto.Repo,
    otp_app: :where_is,
    adapter: Ecto.Adapters.Postgres
end
