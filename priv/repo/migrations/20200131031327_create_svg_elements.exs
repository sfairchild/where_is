defmodule WhereIs.Repo.Migrations.CreateSvgElements do
  use Ecto.Migration

  def change do
    create table(:svg_elements) do
      add :tag, :string
      add :attributes, :map
      add :template_id, references(:templates, type: :binary_id, on_delete: :nothing)

      timestamps()
    end

    create index(:svg_elements, [:template_id])
  end
end
