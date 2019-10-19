defmodule WhereIsWeb.MapLive do
  use Phoenix.LiveView

  def render(assigns) do
    WhereIsWeb.PageView.render("map.html", assigns)
  end

  defmodule User do
    defstruct name: "Roland Canuto", email: "rolandcanuto@outlook.com", username: "rolandc5"
  end

  def mount(_session, socket) do
    socket = socket
            |> assign(:name, "")
            |> assign(:email, "")
            |> assign(:username, "")
            |> assign(:svg, WhereIs.Svg.generate_svg)
    {:ok, socket}
  end

  def handle_event("search", %{"value" => value}, socket) do
    {:noreply, assign(socket, value: value)}
  end

  def handle_event("mockData", _, socket) do
    user = %User{}
    socket = socket
      |> assign(:name, user.name)
      |> assign(:email, user.email)
      |> assign(:username, user.username)
    {:noreply, socket}
  end


end
