class WelcomeController < ApplicationController
  def index
    service = PhotoService.new
    @photo = service.mars_photo
  end
end
