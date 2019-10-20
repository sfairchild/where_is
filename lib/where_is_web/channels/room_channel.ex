defmodule WhereIsWeb.RoomChannel do
# handles the special `"lobby"` subtopic
  def join("*", _payload, socket) do
    {:ok, socket}
  end

# handles any other subtopic as the room ID, for example `"room:12"`, `"room:34"`
  def join("*", _payload, socket) do
    {:ok, socket}
  end
end
