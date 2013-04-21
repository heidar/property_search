class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    respond_to do |format|
      format.html { render file: 'public/404.html', status: 404 }
      format.json { render json: { error: "Not found" }.to_json, status: 404 }
    end
  end
end