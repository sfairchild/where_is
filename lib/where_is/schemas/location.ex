defmodule WhereIs.Location do
  use WhereIs.Schema
  import Ecto.Changeset

  schema "locations" do
    field :name, :string
    field :type, :string
    field :x_coordinate, :float
    field :y_coordinate, :float
    field :rotation, :string
    field :scale, :string
    field :attributes, :map

    belongs_to :map, WhereIs.Map
    belongs_to :template, WhereIs.Template
    has_one :user, WhereIs.User

    timestamps()
  end

  def types() do
    ["seat", "meeting-room", "static"]
  end

  @doc false
  def changeset(%__MODULE__{} = location, attrs \\ %{}) do
    location
    |> cast(attrs, [:name, :x_coordinate])
    |> validate_required([:name, :x_coordinate])
  end
end
