defmodule WhereIs.Repo.Migrations.AddTemplateIdToMaps do
  use Ecto.Migration

  def change do
    alter table(:maps) do
      add :template_id, references(:templates)
    end
    create index(:maps, [:template_id])
  end
end
