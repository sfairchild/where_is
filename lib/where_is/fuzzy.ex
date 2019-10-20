defmodule WhereIs.Fuzzy do
  def find(str) when is_binary(str) do
    users = WhereIs.MattermostUser.fuzzy_search_users(str)
    locations = WhereIs.Locations.fuzzy_search_locations(str)
    rooms = WhereIs.Room.fuzzy_search_rooms(str)
    users ++ locations ++ rooms
    |> Enum.sort_by(fn(u) -> u.rank end) |> Enum.reverse
  end
end
