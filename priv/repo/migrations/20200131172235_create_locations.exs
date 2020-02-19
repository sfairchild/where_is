defmodule WhereIs.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :name, :string
      add :x_corridnate, :string
      add :map_id, references(:map, type: :binary_id, on_delete: :nothing)

      timestamps()
    end

    create index(:locations, [:map_id])
  end
end
