defmodule WhereIs.Repo.Migrations.AddLocationToUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :location_id, references(:locations)
    end
    create index(:users, [:location_id])
  end
end
