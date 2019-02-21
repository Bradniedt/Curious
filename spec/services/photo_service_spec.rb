require 'rails_helper'

describe 'PhotoService' do
  before :each do
    @service = PhotoService.new
  end
  it 'exists' do
    expect(@service).to be_an_instance_of(PhotoService)
  end
  it 'returns JSON from NASA' do
    VCR.use_cassette('service') do
      data = @service.get_nasa_data
      expect(data).to have_key(:img_src)
      expect(data).to have_key(:camera)
      expect(data[:camera]).to have_key(:full_name)
      expect(data).to have_key(:rover)
      expect(data[:rover]).to have_key(:name)
      expect(data[:rover]).to have_key(:landing_date)
      expect(data).to have_key(:sol)
    end
  end
  it 'returns a photo' do
    VCR.use_cassette('photo') do
      photo = @service.get_photo
      expect(photo).to be_an_instance_of(Photo)
    end
  end
end
