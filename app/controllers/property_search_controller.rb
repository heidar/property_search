class PropertySearchController < ApplicationController
  def index
    @properties = Property.filter_by_params params
  end
end