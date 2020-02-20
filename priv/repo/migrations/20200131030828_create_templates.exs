defmodule WhereIs.Repo.Migrations.CreateTemplates do
  use Ecto.Migration

  def change do
    create table(:templates) do
      add :name, :string
      add :label, :string

      timestamps()
    end

  end
end
