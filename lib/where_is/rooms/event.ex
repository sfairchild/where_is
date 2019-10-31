defmodule WhereIs.Rooms.Event do
  require Logger
  alias WhereIs.{ Room, DateFormatter }

  defstruct [:start_time, :end_time]

  def get_todays_events(%Room{} = room), do: get_todays_events(room, 0)
  def get_todays_events(%Room{events: events, name: name}, 5) do
    Logger.error("Error getting events for room \"#{name}\"...")
    events
  end

  def get_todays_events(%Room{} = room, retry_count) do
    events = room |> get_events(start_date(), end_date())
             |> format_response()
             |> format_events()
             |> drop_past_events()
             |> sort_events()

    case events do
      {:error, _error} ->
        :timer.sleep(1000)
        get_todays_events(room, retry_count + 1)
      events -> events
    end
  end

  defp get_events(%WhereIs.Room{email: email}, start_date, end_date) do
    start_date = start_date |> DateFormatter.format_datetime
    end_date = end_date |> DateFormatter.format_datetime

    # TODO: move the rooms api url to a config variable so it can be reused and changed per environment
    "https://rooms.nexient.com/gateway/api/ms-graph-rooms/v2/Rooms/#{ email }/Availability"
    |> HTTPoison.get(%{"X-Rooms-Authorization":  System.get_env("ROOMS_TOKEN")}, params: %{startDate: start_date, endDate: end_date})
  end

  defp get_events(%WhereIs.Room{} = room, _start, _end) do
    {:error, "no email address on room #{room.name} provided"}
  end

  defp start_date do
    Timex.now
    |> Timex.beginning_of_day
    |> Timex.Timezone.convert("UTC")
  end

  defp end_date do
    Timex.now
    |> Timex.end_of_day
    |> Timex.Timezone.convert("UTC")
  end

  defp format_response({:ok, %HTTPoison.Response{body: body}}) do
    Jason.decode(body)
  end
  defp format_response({:error, _} = error), do: error

  defp format_events({:ok, response}) do
    response
    |> Enum.map(fn (%{"end" => %{"dateTime" => end_date}, "start" => %{"dateTime" => start_date}}) ->
      %__MODULE__{start_time: DateFormatter.parse_datetime(start_date), end_time: DateFormatter.parse_datetime(end_date)}
    end)
  end
  defp format_events({:error, _} = error), do: error

  defp drop_past_events(events) when is_list(events) do
    events
    |> Enum.filter(fn (%__MODULE__{end_time: end_time}) -> Timex.before?( Timex.now, end_time ) end)
  end
  defp drop_past_events({:error, _} = error), do: error

  defp sort_events(events) when is_list(events) do
    events
    |> Enum.sort(fn (%__MODULE__{start_time: a_start}, %__MODULE__{start_time: b_start}) ->
      :lt == DateTime.compare(a_start, b_start)
    end)
  end
  defp sort_events({:error, _} = error), do: error
end

