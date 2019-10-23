defmodule WhereIsWeb.SvgController do
  use WhereIsWeb, :controller

  def index(conn, params) do
    nameVar = params["name"]
    nameVar = removeDotSVGFromStringEnd(nameVar)

    svg = WhereIs.Svg.generate_svg

    desk = WhereIs.Locations.find_location(WhereIs.Locations.list, nameVar)
    conn
      |> put_layout(false)
      |> render("svg.svg", svg: svg, x: desk.transform.x, y: desk.transform.y, desk_id: WhereIs.Locations.name_to_id(desk.name))
  end

  def removeDotSVGFromStringEnd(stringVar) do
    if stringVar =~ ".svg" do
      stringVar = String.slice(stringVar, 0..-5)
    else
      IO.puts(stringVar)
    end
  end

  def get_desk(%WhereIs.Locations{} = location), do: location
  def get_desk(_), do: WhereIs.Locations.find_location(WhereIs.Locations.list, "North Desk 30")
end
