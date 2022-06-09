module MapHelper
  def map_external_link(geocoded_object)
    "http://www.google.com/maps/place/#{geocoded_object.latitude},#{geocoded_object.longitude}"
  end
end
