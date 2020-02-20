defmodule WhereIs.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :name, :string
      add :x_coordinate, :float, default: 0.0
      add :y_coordinate, :float, default: 0.0
      add :rotation, :string, default: "0"
      add :scale, :string, default: "1"
      add :attributes, :map, default: %{}

      add :map_id, references(:maps)
      add :template_id, references(:templates)

      timestamps()
    end

    create index(:locations, [:map_id])
    create index(:locations, [:template_id])
  end
end
