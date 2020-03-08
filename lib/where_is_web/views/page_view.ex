defmodule WhereIsWeb.PageView do
  use WhereIsWeb, :view
  alias WhereIs.{Location, Map, Template, User}

  def templates_to_tag([%Template{svg_elements: elements, label: label} = template | rest]) do
    [content_tag(:g, svg_to_tag(elements), id: template.label) | templates_to_tag(rest)]
  end
  def templates_to_tag([]), do: []

  def svg_to_tag([element | rest]) do
    attributes = element.attributes
                 |> Enum.reject(fn({key, _value}) -> Enum.member?(["x_coordinate", "y_coordinate", "rotation", "scale"], key) end)
                 |> Enum.map(fn({key, value}) -> {key, value} end)

    transform = ["style": "fill: var(--primary-color, #2f8bee);", "transform": "translate(#{element.x_coordinate} #{element.y_coordinate}) rotate(#{element.rotation}) scale(#{element.scale})"]

    [content_tag(element.tag, "", attributes ++ transform ) | svg_to_tag(rest) ]
  end
  def svg_to_tag([]), do: []

  def location_to_tag([location | rest]) do
    [content_tag(:use, "",
      "xlink:href": "#"<>location.template.label,
      id: location.id,
      class: location_status(location),
      transform: "translate(#{location.x_coordinate} #{location.y_coordinate}) rotate(#{location.rotation}) scale(#{location.scale})",
      "phx-click": "select-location", "phx-value-location-id": location.id
    ) | location_to_tag(rest)]
  end
  def location_to_tag([]), do: []

  def location_status(location) do
    case location do
      %Location{user: %User{}} -> "location-occupied"
      _ -> "location"
    end
  end

  def selected_location(location) do
    content_tag(:use, "",
      "xlink:href": "#"<>location.template.label,
      class: "selected-location",
      id: location.id,
      transform: "translate(#{location.x_coordinate} #{location.y_coordinate}) rotate(#{location.rotation}) scale(#{location.scale})",
      "phx-click": "select-location", "phx-value-location-id": location.id
    )
  end
end
