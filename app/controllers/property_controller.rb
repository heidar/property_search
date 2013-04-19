class PropertyController < ApplicationController
  respond_to :json

  def index
    properties = Property.filter_by_params params
    respond_with properties
  end
end