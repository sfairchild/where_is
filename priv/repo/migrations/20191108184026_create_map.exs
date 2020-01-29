defmodule WhereIs.Repo.Migrations.CreateMap do
  use Ecto.Migration

  def change do
    create table(:map, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :x_coordinate, :float, default: 0.0
      add :y_coordinate, :float, default: 0.0
      add :rotation, :string, default: "0"
      add :scale, :string, default: "1"
      add :attributes, :json
    end
  end
end
