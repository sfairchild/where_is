defmodule WhereIs.Template do
  use WhereIs.Schema
  import Ecto.Changeset

  schema "templates" do
    field :name, :string
    field :label, :string
    field :is_map, :boolean

    has_many :svg_elements, WhereIs.SvgElement

    timestamps()
  end

  @doc false
  def changeset(template, attrs) do
    template
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
