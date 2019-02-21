class WelcomeController < ApplicationController
  def index
    service = PhotoService.new
    @photo = service.get_photo
  end
end
