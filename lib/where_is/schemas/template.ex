defmodule WhereIs.Template do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "templates" do
    field :name, :string
    field :label, :string

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
