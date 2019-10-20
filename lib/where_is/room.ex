defmodule WhereIs.Room do
  use GenServer

  defstruct name: "", email: "", event: %{}, status: :free, next_event: %{}, rank: 0, transform: %{width: 200, height: 200, x: 0, y: 0, rotate: "0"}


  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(state) do
    state = %{remainging_rooms: list(), rooms: list()}

    schedule_poller()
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
    now = DateTime.utc_now
    start_date = now |> format_datetime
    end_date = now
                # 86400 seconds = 24 hours
                |> DateTime.add(86400)
                |> format_datetime

    {:ok, response} = "https://rooms.nexient.com/gateway/api/ms-graph-rooms/v2/Rooms/#{ room.email }/Availability"
                      |> HTTPoison.get(%{"X-Rooms-Authorization":  System.get_env("ROOMS_TOKEN")}, params: %{startDate: start_date, endDate: end_date})
    {:ok, events} = Jason.decode(response.body)
    events
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
      %__MODULE__{name: "South Huddle 1", email: "shuddle1@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 2", email: "shuddle2@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 3", email: "shuddle3@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 4", email: "shuddle4@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 5", email: "shuddle5@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 6", email: "shuddle6@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 7", email: "shuddle7@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 8", email: "shuddle8@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 9", email: "shuddle9@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 10", email: "shuddle10@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 11", email: "shuddle11@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 12", email: "shuddle12@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 13", email: "shuddle13@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 14", email: "shuddle14@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 15", email: "shuddle15@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 16", email: "shuddle16@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 17", email: "shuddle17@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 18", email: "shuddle18@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 19", email: "shuddle19@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 20", email: "shuddle20@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Huddle 21", email: "shuddle21@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},

      %__MODULE__{name: "North Huddle 1", email: "nhuddle1@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "North Huddle 2", email: "nhuddle2@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "North Huddle 3", email: "nhuddle3@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "North Huddle 4", email: "nhuddle4@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "North Huddle 5", email: "nhuddle5@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "North Huddle 6", email: "nhuddle6@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "North Huddle 7", email: "nhuddle7@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "North Huddle 8", email: "nhuddle8@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "North Huddle 9", email: "nhuddle9@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "North Huddle 10", email: "nhuddle10@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "North Huddle 11", email: "nhuddle11@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "North Huddle 12", email: "nhuddle12@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},

      %__MODULE__{name: "South Conference A", email: "SConferenceA@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Conference B", email: "SConferenceB@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Conference C", email: "SConferenceC@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Conference D", email: "SConferenceD@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "South Conference E", email: "SConferenceE@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},

      %__MODULE__{name: "North Conference 1", email: "NConference1@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "North Conference 2", email: "NConference2@nexient.com", transform: %{x: 0, y: 400, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "North Conference 3", email: "NConference3@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "North Conference 4", email: "NConference4@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "North Conference 5", email: "NConference5@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
      %__MODULE__{name: "North Conference 6", email: "NConference6@nexient.com", transform: %{x: 0, y: 0, rotate: "0", height: 10, width: 20}},
    ]
  end

  defp format_datetime(datetime) do
    "#{datetime.year}-#{zero_pad datetime.month}-#{zero_pad datetime.day}T#{zero_pad datetime.hour}:#{zero_pad datetime.minute}:#{zero_pad datetime.second}"
  end

  defp zero_pad(str, num \\ 2) do
    String.pad_leading("#{str}", num, "0")
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

