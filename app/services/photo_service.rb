class PhotoService
  def initialize
    @conn = Faraday.new("https://api.nasa.gov/") do |f|
      f.adapter Faraday.default_adapter
    end
    @sol = rand(1..1000)
  end

  def mars_photo
    response = @conn.get("mars-photos/api/v1/rovers/curiosity/photos?") do |f|
      f.params["sol"] = @sol
      f.params["page"] = 1
      f.params["camera"] = "NAVCAM"
      f.params["api_key"] = ENV['NASA_KEY']
    end
    result = JSON.parse(response.body, symbolize_names: true)[:photos]
    photo_data = result.shuffle.pop
    if photo_data.nil?
      mars_photo
    end 
    pic = Photo.new(photo_data)
  end

end
