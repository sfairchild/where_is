defmodule WhereIs.MattermostRoom do
  @enforce_keys [:name, :email]
  defstruct id: "", name: "", first_name: "", last_name: "", email: "", location_id: "", rank: 0

  alias WhereIs.MattermostRoom

  def fuzzy_search_rooms(str) when is_binary(str) do
    fuzzy_search_rooms(WhereIs.Rooms.get_rooms, String.downcase(str))
  end

  def fuzzy_search_rooms([%__MODULE__{} = room | rooms], str) do
    Enum.sort_by([get_jaro_number(room, str) | fuzzy_search_rooms(rooms, str)], fn(r) -> r.rank end)
      |> Enum.reverse
  end

  def fuzzy_search_rooms([], _str ), do: []

  def get_jaro_number(%__MODULE__{} = room, str) do
    rank = Enum.max [
      String.jaro_distance(String.downcase(room.name), str),
      String.jaro_distance(String.downcase(room.email), str),
      String.jaro_distance(String.downcase("#{room.first_name} #{room.last_name}"), str)
    ]
    %__MODULE__{room | rank: rank}
  end

  def makeRoom(roomMap) do
    keys = Map.keys(roomMap)
    room = createRoom(roomMap, keys)
  end

  def makeRooms(rooms) do
    numOfRooms = Enum.count(rooms)
    roomsList = []
    makeRooms(rooms, roomsList, numOfRooms - 1)
  end

  defp makeRooms(rooms, roomsList, n) when n <= 0 do
    {:ok, roomMap} = Enum.fetch(rooms, n)
    room = makeRoom(roomMap)
    roomsList = [room | roomsList]
  end

  defp makeRooms(rooms, roomsList, n) do
    {:ok, roomMap} = Enum.fetch(rooms, n)
    room = makeRoom(roomMap)
    roomsList = [room | roomsList]
    makeRooms(rooms, roomsList, n - 1)
  end

  defp createRoom(roomMap, keys) do
    {:ok, id} = Map.fetch(roomMap, "id")
    {:ok, name} = Map.fetch(roomMap, "name")
    {:ok, email} = Map.fetch(roomMap, "email")
    {:ok, firstName} = Map.fetch(roomMap, "first_name")
    {:ok, lastName} = Map.fetch(roomMap, "last_name")

    %__MODULE__{id: id, name: name, first_name: firstName, last_name: lastName, email: email}
  end

  defp buildRoomFromMap([head | tail], roomMap, room) do
    {value, roomMap} = Map.pop(roomMap, head)
    {value, roomMap} = Map.pop(roomMap, head) # not sure why this is hear twice. Remove?
    room = assignVariable(head, value, room)

    buildRoomFromMap(tail, roomMap, room)
  end

  defp buildRoomFromMap([], roomMap, room) do
    room
  end

  defp assignVariable(key, value, room) do
    Map.put(room, key, value)
  end

  def fetchCurrentMattermostRoomsList do
    {:ok, rooms} = fetchRoomsFromMattermost()

    roomsList = WhereIs.MattermostRoom.makeRooms(rooms)
  end

  def fetchRoomsFromMattermost do
    url = "http://54.91.189.149:8065/api/v4/rooms"
    headers = [{"Authorization", "Bearer ih7cgnr3otd5igzkawtwrhu5ia"},
               {"Content-Type", "application/json; charset=utf-8"}]

    {:ok, response} = HTTPoison.get(url, headers)
    Jason.decode(response.body())
  end

end
