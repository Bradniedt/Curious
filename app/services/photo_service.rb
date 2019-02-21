class PhotoService
  def initialize
    @conn = Faraday.new("https://api.nasa.gov/") do |f|
      f.adapter Faraday.default_adapter
    end
    @sol = 1000
  end

  def get_url(url)
    response = @conn.get(url) do |f|
      f.params["sol"] = @sol
      f.params["page"] = 1
      f.params["camera"] = "NAVCAM"
      f.params["api_key"] = ENV['NASA_KEY']
    end
  end

  def get_nasa_data
    response = get_url("mars-photos/api/v1/rovers/curiosity/photos?")
    result = JSON.parse(response.body, symbolize_names: true)[:photos]
    if result.length == 0
      mars_photo
    end
    photo_data = result.shuffle.pop
  end

  def get_photo
    pic = Photo.new(get_nasa_data)
  end

end
