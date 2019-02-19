class Photo
  attr_reader :url, :camera, :rover, :landing, :sol
  def initialize(data)
    @url = data[:img_src]
    @camera = data[:camera][:full_name]
    @rover = data[:rover][:name]
    @landing = data[:rover][:landing_date]
    @sol = data[:sol]
  end
end
