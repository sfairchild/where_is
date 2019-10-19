defmodule WhereIs.Room do
  use GenServer

  defstruct name: "", email: "", events: []


  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  @impl true
  def init(state) do
    %{remainging_rooms: list, rooms: list}

    {:ok, state}
  end

  def schedule_poller do
    send self(), :update
  end

  def handle_info(:update, ) do

  end

  def get_events(%__MODULE__{} = room) do
    now = DateTime.utc_now
    start_date = now |> format_datetime
    end_date = now
                # 86400 seconds = 24 hours
                |> DateTime.add(86400 * 5)
                |> format_datetime

    {:ok, response} = "https://rooms.nexient.com/gateway/api/ms-graph-rooms/v2/Rooms/#{ room.email }/Availability"
                      |> HTTPoison.get(%{"X-Rooms-Authorization":  System.get_env("ROOMS_TOKEN")}, params: %{startDate: start_date, endDate: end_date})
    {:ok, events} = Jason.decode(response.body)
    events
  end

  def list do
    [
      %__MODULE__{name: "South Huddle 1", email: "shuddle1@nexient.com"},
      %__MODULE__{name: "South Huddle 2", email: "shuddle2@nexient.com"},
      %__MODULE__{name: "South Huddle 3", email: "shuddle3@nexient.com"},
      %__MODULE__{name: "South Huddle 4", email: "shuddle4@nexient.com"},
      %__MODULE__{name: "South Huddle 5", email: "shuddle5@nexient.com"},
      %__MODULE__{name: "South Huddle 6", email: "shuddle6@nexient.com"},
      %__MODULE__{name: "South Huddle 7", email: "shuddle7@nexient.com"},
      %__MODULE__{name: "South Huddle 8", email: "shuddle8@nexient.com"},
      %__MODULE__{name: "South Huddle 9", email: "shuddle9@nexient.com"},
      %__MODULE__{name: "South Huddle 10", email: "shuddle10@nexient.com"},
      %__MODULE__{name: "South Huddle 11", email: "shuddle11@nexient.com"},
      %__MODULE__{name: "South Huddle 12", email: "shuddle12@nexient.com"},
      %__MODULE__{name: "South Huddle 13", email: "shuddle13@nexient.com"},
      %__MODULE__{name: "South Huddle 14", email: "shuddle14@nexient.com"},
      %__MODULE__{name: "South Huddle 15", email: "shuddle15@nexient.com"},
      %__MODULE__{name: "South Huddle 16", email: "shuddle16@nexient.com"},
      %__MODULE__{name: "South Huddle 17", email: "shuddle17@nexient.com"},
      %__MODULE__{name: "South Huddle 18", email: "shuddle18@nexient.com"},
      %__MODULE__{name: "South Huddle 19", email: "shuddle19@nexient.com"},
      %__MODULE__{name: "South Huddle 20", email: "shuddle20@nexient.com"},
      %__MODULE__{name: "South Huddle 21", email: "shuddle21@nexient.com"},
    ]
  end

  defp format_datetime(datetime) do
    "#{datetime.year}-#{zero_pad datetime.month}-#{zero_pad datetime.day}T#{zero_pad datetime.hour}:#{zero_pad datetime.minute}:#{zero_pad datetime.second}"
  end

  defp zero_pad(str, num \\ 2) do
    String.pad_leading("#{str}", num, "0")
  end
end

