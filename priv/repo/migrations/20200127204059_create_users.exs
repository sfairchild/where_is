defmodule WhereIs.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :username, :string
      add :display_name, :string
      add :first_name, :string
      add :last_name, :string
      add :photo_url, :string
      add :admin, :boolean

      add :manager_id, references(:users)
      add :coach_id, references(:users)
      timestamps()
    end
  end
end
