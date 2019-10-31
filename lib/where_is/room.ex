defmodule WhereIs.Room do
  use GenServer

  defstruct name: "", email: "", event: %{}, events: [], status: :free, next_event: %{}, rank: 0, transform: %{width: 200, height: 200, x: 0, y: 0, rotate: "0"}


  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(state) do
    state = %{remainging_rooms: list(), rooms: list()}

    # schedule_poller()
    {:ok, state}
  end

  def schedule_poller do
    :timer.sleep(100);
    send self(), :update
  end

  def get_rooms do
    GenServer.call(__MODULE__, :rooms)
  end

  def handle_call(:rooms, _, state) do
    {:reply, state.rooms, state}
  end

  def handle_info(:update, %{remainging_rooms: [h | t], rooms: rooms} = state) do
    events = get_events(h)

    rooms = case Enum.sort(events, fn %{"start" => %{"dateTime" => x}}, %{"start" => %{"dateTime" => y}} -> :lt == Timex.compare(Timex.parse(y, "{RFC3339}"), Timex.parse(x, "{RFC3339}")) end) do
      [%{} = event | t] ->
        {first_list, [found_room | last_list]} = Enum.split_while(rooms, fn (r) -> r.name != h.name end)

        {:ok, start_time} = Timex.parse(event["start"]["dateTime"], "{RFC3339}")
        {:ok, end_time} = Timex.parse(event["end"]["dateTime"], "{RFC3339}")

        found_room = %__MODULE__{found_room | next_event: %{ start: start_time, end: end_time, }, status: get_status(start_time)}

        WhereIsWeb.Endpoint.broadcast("rooms", "updated", %{rooms: rooms})

        rooms = first_list ++ [found_room | last_list]
      _ -> rooms
    end

    schedule_poller()

    {:noreply, %{state | rooms: rooms, remainging_rooms: t}}
  end

  def get_status(start_time) do
    # IO.inspec start_time
    # IO.inspect Timex.now()
    free?(Timex.before?(start_time, Timex.now))
  end

  def free?(true), do: :free
  def free?(false), do: :busy

  def handle_info(:update, %{remainging_rooms: []} = state) do
    schedule_poller()
    {:noreply, %{state | remainging_rooms: list()}}
  end

  def handle_info(_, state) do
    schedule_poller()
    {:noreply, state}
  end

  def find_room([%__MODULE__{name: name} = room | t], name), do: room
  def find_room([_|t], name), do: find_room(t, name)
  def find_room([], _name), do: nil

  def get_events(%__MODULE__{} = room) do
    # now = DateTime.utc_now
    # start_date = now |> format_datetime
    # end_date = now
    #             # 86400 seconds = 24 hours
    #             |> DateTime.add(86400)
    #             |> format_datetime

    # events = case "https://rooms.nexient.com/gateway/api/ms-graph-rooms/v2/Rooms/#{ room.email }/Availability"
    # |> HTTPoison.get(%{"X-Rooms-Authorization":  System.get_env("ROOMS_TOKEN")}, params: %{startDate: start_date, endDate: end_date}) do
    #   {:ok, events} -> Jason.decode(response.body)
    #     {:error, %HTTPoison.Error{}}

    # end
    # events
  end

  def name_to_id(name) do
    String.replace(name, " ", "_")
  end
  def room_to_svg_tuple(%__MODULE__{name: name, status: status, transform: transform} = location) do
    {:rect,
      %{
        name: name,
        id: name_to_id(name),
        style: "fill: #{busy_style(location)};",
        "phx-click": "search",
        "phx-value-search": name,
        transform: "translate(#{transform.x} #{transform.y}) rotate(#{transform.rotate})",
        height: "#{transform.height}px",
        width: "#{transform.height}px" }, []}
  end

  def busy_style(%{status: :free}) do
    "green"
  end

  def busy_style(%{status: :busy}) do
    "red"
  end

  def busy_style(_) do
    ""
  end

  def list do
    [
      %__MODULE__{name: "South Huddle 1", email: "shuddle1@nexient.com", transform: %{x: -705, y: 2020, rotate: "22", height: 37, width: 45}},
      %__MODULE__{name: "South Huddle 2", email: "shuddle2@nexient.com", transform: %{x: -738, y: 2007, rotate: "22", height: 35, width: 35}},
      %__MODULE__{name: "South Huddle 3", email: "shuddle3@nexient.com", transform: %{x: -834, y: 1967, rotate: "22", height: 35, width: 30}},
      %__MODULE__{name: "South Huddle 4", email: "shuddle4@nexient.com", transform: %{x: -880, y: 1948, rotate: "22", height: 35, width: 45}},
      %__MODULE__{name: "South Huddle 5", email: "shuddle5@nexient.com", transform: %{x: -720, y: 1705, rotate: "22", height: 32, width: 32}},
      %__MODULE__{name: "South Huddle 6", email: "shuddle6@nexient.com", transform: %{x: -705, y: 1667, rotate: "22", height: 37, width: 32}},
      %__MODULE__{name: "South Huddle 7", email: "shuddle7@nexient.com", transform: %{x: -425, y: 1314, rotate: "0", height: 35, width: 34}},
      %__MODULE__{name: "South Huddle 8", email: "shuddle8@nexient.com", transform: %{x: -390, y: 1314, rotate: "0", height: 34, width: 38}},
      %__MODULE__{name: "South Huddle 9", email: "shuddle9@nexient.com", transform: %{x: -349, y: 1314, rotate: "0", height: 34, width: 37}},
      %__MODULE__{name: "South Huddle 10", email: "shuddle10@nexient.com", transform: %{x: -310, y: 1314, rotate: "0", height: 34, width: 40}},
      %__MODULE__{name: "South Huddle 11", email: "shuddle11@nexient.com", transform: %{x: -165, y: 1314, rotate: "0", height: 32, width: 38}},
      %__MODULE__{name: "South Huddle 12", email: "shuddle12@nexient.com", transform: %{x: -305, y: 1515, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 13", email: "shuddle13@nexient.com", transform: %{x: -345, y: 1515, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 14", email: "shuddle14@nexient.com", transform: %{x: -380, y: 1515, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 15", email: "shuddle15@nexient.com", transform: %{x: -568, y: 1720, rotate: "22", height: 33, width: 33}},
      %__MODULE__{name: "South Huddle 16", email: "shuddle16@nexient.com", transform: %{x: -585, y: 1758, rotate: "22", height: 38, width: 36}},
      %__MODULE__{name: "South Huddle 17", email: "shuddle17@nexient.com", transform: %{x: -618, y: 1702, rotate: "22", height: 40, width: 33}},
      %__MODULE__{name: "South Huddle 18", email: "shuddle18@nexient.com", transform: %{x: -632, y: 1740, rotate: "22", height: 34, width: 33}},

      %__MODULE__{name: "South Huddle 19", email: "shuddle19@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 20", email: "shuddle20@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 21", email: "shuddle21@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},

      %__MODULE__{name: "North Huddle 1", email: "nhuddle1@nexient.com", transform: %{x: 194, y: 1104, rotate: "0", height: 43, width: 33}},
      %__MODULE__{name: "North Huddle 2", email: "nhuddle2@nexient.com", transform: %{x: 158, y: 1104, rotate: "0", height: 43, width: 33}},
      %__MODULE__{name: "North Huddle 3", email: "nhuddle3@nexient.com", transform: %{x: 122, y: 1104, rotate: "0", height: 43, width: 33}},
      %__MODULE__{name: "North Huddle 4", email: "nhuddle4@nexient.com", transform: %{x: 86, y: 1104, rotate: "0", height: 43, width: 33}},
      %__MODULE__{name: "North Huddle 5", email: "nhuddle5@nexient.com", transform: %{x: 10, y: 415, rotate: "0", height: 30, width: 45}},
      %__MODULE__{name: "North Huddle 6", email: "nhuddle6@nexient.com", transform: %{x: 54, y: 3, rotate: "0", height: 43, width: 30}},
      %__MODULE__{name: "North Huddle 7", email: "nhuddle7@nexient.com", transform: %{x: 85, y: 3, rotate: "0", height: 43, width: 30}},
      %__MODULE__{name: "North Huddle 8", email: "nhuddle8@nexient.com", transform: %{x: 116, y: 3, rotate: "0", height: 43, width: 29}},
      %__MODULE__{name: "North Huddle 9", email: "nhuddle9@nexient.com", transform: %{x: 146, y: 3, rotate: "0", height: 43, width: 29}},
      %__MODULE__{name: "North Huddle 10", email: "nhuddle10@nexient.com", transform: %{x: 195, y: 510, rotate: "0", height: 31, width: 32}},
      %__MODULE__{name: "North Huddle 11", email: "nhuddle11@nexient.com", transform: %{x: 195, y: 542, rotate: "0", height: 27, width: 32}},
      %__MODULE__{name: "North Huddle 12", email: "nhuddle12@nexient.com", transform: %{x: 195, y: 619, rotate: "0", height: 30, width: 32}},

      %__MODULE__{name: "South Conference A", email: "SConferenceA@nexient.com", transform: %{x: -801, y: 1980, rotate: "22", height: 35, width: 66}},
      %__MODULE__{name: "South Conference B", email: "SConferenceB@nexient.com", transform: %{x: -686, y: 1622, rotate: "22", height: 46, width: 90}},
      %__MODULE__{name: "South Conference C", email: "SConferenceC@nexient.com", transform: %{x: -669, y: 1580, rotate: "22", height: 44, width: 90}},
      %__MODULE__{name: "South Conference D", email: "SConferenceD@nexient.com", transform: %{x: -635, y: 1314, rotate: "0", height: 50, width: 70}},
      %__MODULE__{name: "North Conference 1", email: "NConference1@nexient.com", transform: %{x: 10, y: 1094, rotate: "0", height: 55, width: 44}},
      %__MODULE__{name: "North Conference 2", email: "NConference2@nexient.com", transform: %{x: 10, y: 875, rotate: "0", height: 61, width: 45}},
      %__MODULE__{name: "North Conference 3", email: "NConference3@nexient.com", transform: %{x: 10, y: 815, rotate: "0", height: 55, width: 45}},
      %__MODULE__{name: "North Conference 4", email: "NConference4@nexient.com", transform: %{x: 10, y: 3, rotate: "0", height: 43, width: 43}},
      %__MODULE__{name: "North Conference 5", email: "NConference5@nexient.com", transform: %{x: 177, y: 3, rotate: "0", height: 43, width: 52}},
      %__MODULE__{name: "North Conference 6", email: "NConference6@nexient.com", transform: %{x: 195, y: 416, rotate: "0", height: 69, width: 31}},
    ]
  end

  def fuzzy_search_rooms(str) do
    list()
    |> fuzzy_search_rooms(String.downcase(str))
    |> Enum.sort_by(fn(u) -> u.rank end)
  end

  def fuzzy_search_rooms([%__MODULE__{name: name} = room | tail], str) do
    jaro = String.jaro_distance(name, str)
    [%__MODULE__{room | rank: jaro} | fuzzy_search_rooms(tail, str)]
  end

  def fuzzy_search_rooms([], _str), do: []

end

