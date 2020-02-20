defmodule WhereIs.SvgElement do
  use WhereIs.Schema
  import Ecto.Changeset

  schema "svg_elements" do
    field :attributes, :map
    field :tag, :string

    belongs_to :template, WhereIs.Template

    timestamps()
  end

  @doc false
  def changeset(svg_element, attrs) do
    svg_element
    |> cast(attrs, [:tag, :attributes])
    # |> validate_required([:tag, :attributes])
  end
end
