
defmodule WhereIsWeb.MapLive do
  use Phoenix.LiveView

  def render(assigns) do
    WhereIsWeb.PageView.render("map.html", assigns)
  end

  defmodule User do
    defstruct name: "Roland Canuto", email: "rolandcanuto@outlook.com", username: "rolandc5", location: "Desk 200"
  end

  def mount(_session, socket) do
    WhereIsWeb.Endpoint.subscribe("rooms")
    socket = socket
      |> assign(:titleName, "Randy")
      |> assign(:searchValue, "")
      |> assign(:name, "")
      |> assign(:email, "")
      |> assign(:username, "")
      |> assign(:userData, "")
      |> assign(:location, "")
      |> assign(:svg, WhereIs.Svg.generate_svg)
    {:ok, socket}
  end

  def handle_info(a, b, socket) do

    IO.puts "RECEIVED CHANNEL"
    IO.inspect a
    IO.inspect b
    {:noreply, socket}
  end

  def handle_event("search", %{"search" => value}, socket) do
    {:noreply, assign(socket, :searchValue, value)}
  end

  def handle_event("autosuggest", %{"name" => value}, socket) do
    socket = socket
      |> assign(:searchValue, value)
    {:noreply, socket}
  end

  def handle_event("nameclick", _, socket) do
    socket = socket |> assign(:titleName, getTitleName())
    {:noreply, socket}
  end

  def getTitleName() do
    ["Randy", "Jamal", "Pedro", "Jakob", "Jane", "L-a", "Laurel", "Yanny"]
      |> Enum.random
  end

  def handle_info(:tick, socket) do
    Process.send_after(self(), :tick, 1000)
    {:noreply, assign(socket, :titleName, "Sally")}
  end

  def handle_event("getData", _, socket) do
    user = %User{}
    socket = socket
      |> assign(:location, user.location)
      |> assign(:name, user.name)
      |> assign(:email, user.email)
      |> assign(:username, user.username)
    {:noreply, socket}
  end

end

