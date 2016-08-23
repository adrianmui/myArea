module ApplicationHelper
  def static_map_for(latitude, longitude, address, options = {})
    params = {
      :center => [latitude, longitude].join(","),
      :zoom => 15,
      :size => "500x500",
      :markers => [latitude, longitude].join(","),
      :sensor => true
      }.merge(options)

    query_string =  params.map{|k,v| "#{k}=#{v}"}.join("&")
    
    "http://maps.googleapis.com/maps/api/staticmap?#{query_string}"
    end
end
