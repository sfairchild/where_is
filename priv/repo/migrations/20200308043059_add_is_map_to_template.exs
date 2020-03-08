defmodule WhereIs.Repo.Migrations.AddIsMapToTemplate do
  use Ecto.Migration

  def change do
    alter table(:templates) do
      add :is_map, :boolean, default: false
    end
  end
end
