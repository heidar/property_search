class PropertyController < ApplicationController
  respond_to :json

  def index
    properties = Property.filter_by_params params
    respond_with properties
  end

  def show
    respond_with Property.find params[:id]
  end
end