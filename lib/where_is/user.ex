defmodule WhereIs.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "users" do
    field :email, :string
    field :username, :string
    field :display_name, :string
    field :first_name, :string
    field :last_name, :string
    field :photo_url, :string

    belongs_to :manager, WhereIs.User
    belongs_to :coach, WhereIs.User

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    IO.puts "TESTING CHANGESET..."
    IO.inspect(attrs)
    user
    |> cast(attrs, [:email])
  end
end
