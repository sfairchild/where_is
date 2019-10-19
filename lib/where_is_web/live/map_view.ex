
defmodule WhereIsWeb.MapLive do
  use Phoenix.LiveView

  def render(assigns) do
    WhereIsWeb.PageView.render("map.html", assigns)
  end

  def mount(_session, socket) do
    socket = socket
      |> assign(:titleName, "Randy")
      |> assign(:searchValue, "")
      |> assign(:svg, WhereIs.Svg.generate_svg)
    {:ok, socket}
  end

  def handle_event("search", %{"search" => value}, socket) do
    IO.puts(value)
    {:noreply, assign(socket, :searchValue, value)}
  end

  def handle_event("autosuggest", %{"name" => value}, socket) do
    socket = socket |> assign(:searchValue, value)
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
end
