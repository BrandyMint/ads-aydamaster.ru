module PlacesHelper
  def generate_place_code(place)
    "<div class=\"aydabanner\" id=\"aydabanner_#{place.id}\" style=\"width: #{place.format.width}px; height: #{place.format.height}px\"></div>"
  end
end
