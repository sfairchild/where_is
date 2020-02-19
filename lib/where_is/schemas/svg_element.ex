defmodule WhereIs.SvgElement do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "svg_elements" do
    field :attributes, :map
    field :tag, :string
    # field :template_id, :id

    belongs_to :template, WhereIs.Template

    timestamps()
  end

  @doc false
  def changeset(svg_element, attrs) do
    svg_element
    |> cast(attrs, [:tag, :attributes])
    |> validate_required([:tag, :attributes])
  end
end
