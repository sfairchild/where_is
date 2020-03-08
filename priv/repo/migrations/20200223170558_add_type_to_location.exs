defmodule WhereIs.Repo.Migrations.AddTypeToLocation do
  use Ecto.Migration

  def up() do
    execute("CREATE TYPE location_types AS ENUM('seat', 'meeting_room', 'static');")
    execute("ALTER TABLE locations ADD COLUMN type location_types DEFAULT 'static';")
  end

  def down() do
    execute("ALTER TABLE locations DROP COLUMN type")
    execute("DROP TYPE IF EXISTS location_types")
  end
end
