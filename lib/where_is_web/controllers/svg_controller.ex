defmodule WhereIsWeb.SvgController do
  use WhereIsWeb, :controller

  def index(conn, params) do
    svg = WhereIs.Svg.generate_svg

    desk = WhereIs.Locations.find_location(WhereIs.Locations.list, params["name"])
    conn
      |> put_layout(false)
      |> render("svg.svg", svg: svg, x: desk.transform.x, y: desk.transform.y, desk_id: WhereIs.Locations.name_to_id(desk.name))
  end

  def get_desk(%WhereIs.Locations{} = location), do: location
  def get_desk(_), do: WhereIs.Locations.find_location(WhereIs.Locations.list, "North Desk 30")
end
