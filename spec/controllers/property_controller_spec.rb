require 'spec_helper'

# TODO: DRY
describe PropertyController do

  # TODO: Add Factory
  Property.create(
    name: 'London house',
    bedroom_count: 1,
    latitude: 51.501000,
    longitude: -0.142000
  )
  Property.create(
    name: 'London flat',
    bedroom_count: 2,
    latitude: 51.523778,
    longitude: -0.205500
  )
  Property.create(
    name: 'London bunker',
    bedroom_count: 3,
    latitude: 51.503000,
    longitude: -0.232300
  )
  Property.create(
    name: 'Norwich manor',
    bedroom_count: 4,
    latitude: 52.644365,
    longitude: 1.31381
  )
  
  describe 'GET index' do
    it 'returns http success' do
      get :index, format: :json
      response.should be_success        
    end

    it 'returns correct JSON' do
      get :index, format: :json
      JSON.parse(response.body).should be_instance_of(Array)
    end

    it 'returns 4 properties' do
      get :index, format: :json
      JSON.parse(response.body).length.should eq(4)
    end

    it 'has correct keys for the first property' do
      get :index, format: :json
      property = JSON.parse(response.body).first
      property.should be_an_instance_of(Hash)
      property.has_key?('name').should be_true
      property.has_key?('bedroom_count').should be_true
      property.has_key?('latitude').should be_true
      property.has_key?('longitude').should be_true
    end

    it 'can filter by name' do
      get :index, format: :json, name: 'manor'
      properties = JSON.parse(response.body)
      properties.length.should eq(1)
      properties.first['name'].should eq('Norwich manor')
    end

    it 'can filter by bedroom_count' do
      get :index, format: :json, bedroom_count: 4
      properties = JSON.parse(response.body)
      properties.length.should eq(1)
      properties.first['name'].should eq('Norwich manor')
    end

    it 'can filter by similar properties' do
      get :index, format: :json, similar: 2
      properties = JSON.parse(response.body)
      properties.length.should eq(1)
      properties.first['name'].should eq('London bunker')
    end
  end
end