defmodule WhereIs.Repo.Migrations.CreateMap do
  use Ecto.Migration

  def change do
    create table(:maps) do
      add :name, :string, required: true
      add :display_name, :string, default: ""
      add :x_coordinate, :float, default: 0.0
      add :y_coordinate, :float, default: 0.0
      add :rotation, :string, default: "0"
      add :scale, :string, default: "1"
      add :attributes, :json
    end
  end
end
