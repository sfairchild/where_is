defmodule WhereIs.DateFormatter do
  def format_datetime(datetime) do
    "#{datetime.year}-#{zero_pad datetime.month}-#{zero_pad datetime.day}T#{zero_pad datetime.hour}:#{zero_pad datetime.minute}:#{zero_pad datetime.second}"
  end

  def parse_datetime(datetime) when is_binary(datetime) do
    {:ok, datetime} = Timex.parse(datetime <> "Z", "{RFC3339z}")
    datetime
  end

  defp zero_pad(str, num \\ 2) do
    String.pad_leading("#{str}", num, "0")
  end
end

