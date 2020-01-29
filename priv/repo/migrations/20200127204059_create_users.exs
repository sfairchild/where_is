defmodule WhereIs.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :string
      add :username, :string
      add :display_name, :string
      add :first_name, :string
      add :last_name, :string
      add :photo_url, :string

      add :manager_id, references(:users, type: :binary_id)
      add :coach_id, references(:users, type: :binary_id)
      timestamps()
    end

  end
end
