defmodule WhereIs.Repo.Migrations.AddUserStatus do
  use Ecto.Migration

  def change do

    alter table(:users) do
      add :active, :boolean, default: true
    end

    create index(:users, ["lower(email)"], name: :users_email_index, unique: true)
  end
end
