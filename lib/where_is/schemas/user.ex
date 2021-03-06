defmodule WhereIs.User do
  use WhereIs.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :username, :string
    field :display_name, :string
    field :first_name, :string
    field :last_name, :string
    field :photo_url, :string
    field :admin, :boolean
    field :active, :boolean

    belongs_to :manager, WhereIs.User
    belongs_to :coach, WhereIs.User
    belongs_to :location, WhereIs.Location

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :admin, :location_id])
  end
end
