defmodule WhereIs.Map do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "map" do
    field :name, :string
    field :x_coordinate, :float
    field :y_coordinate, :float
    field :rotation, :string
    field :scale, :string
    field :attributes, :map

    belongs_to :template, WhereIs.Template
    has_many :locations, WhereIs.Location
  end
end
