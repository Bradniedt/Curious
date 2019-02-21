require 'rails_helper'

describe Photo, type: :model do
  before :each do
    @data = { img_src: 'a url',
            camera: { full_name: 'a name' },
            rover: { name: 'a name', landing_date: 'a date' },
            sol: 1000 }
    @photo = Photo.new(@data)
  end
  it 'exists' do
    expect(@photo).to be_an_instance_of(Photo)
  end
  it 'has attributes' do
    expect(@photo.url).to eq(@data[:img_src])
    expect(@photo.camera).to eq(@data[:camera][:full_name])
    expect(@photo.rover).to eq(@data[:rover][:name])
    expect(@photo.landing).to eq(@data[:rover][:landing_date])
    expect(@photo.sol).to eq(@data[:sol])
  end
end
