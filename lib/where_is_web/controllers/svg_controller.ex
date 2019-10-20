defmodule WhereIsWeb.SvgController do
  use WhereIsWeb, :controller

  def index(conn, params) do
    svg = WhereIs.Svg.generate_svg

    IO.puts "CALLED"
    IO.inspect params
    desk = WhereIs.Locations.find_location(WhereIs.Locations.list, params["name"])
    IO.inspect desk
    conn
      |> put_layout(false)
      |> render("svg.svg", svg: svg, x: desk.transform.x, y: desk.transform.y, desk_id: WhereIs.Locations.name_to_id(desk.name))
  end
end
