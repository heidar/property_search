class PropertyController < ApplicationController
  respond_to :json

  def index
    @properties = Property.filter_by_params params
    respond_to do |format|
      format.html
      format.json { render :json => @properties }
    end
  end

  def show
    # Lets pretend there is some logic here to check that the property is rented
    # and assume that it always is.
    @property = Property.find(params[:id])
    similar = { similar: params[:id] }
    @properties = Property.filter_by_params similar
    respond_to do |format|
      format.html
      format.json { render :json => @properties }
    end
  end
end