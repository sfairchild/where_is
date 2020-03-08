defmodule WhereIs.Repo.Migrations.AddPositioningToSvgElements do
  use Ecto.Migration

  def change do
    alter table(:svg_elements) do
      add :x_coordinate, :float, default: 0.0
      add :y_coordinate, :float, default: 0.0
      add :rotation, :string, default: "0"
      add :scale, :string, default: "1"
    end
  end
end
