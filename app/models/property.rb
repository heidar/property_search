class Property < ActiveRecord::Base
  attr_accessible :bedroom_count, :latitude, :longitude, :name

  def self.filter_by_params params
    scoped = self.scoped
    
    if params[:name].present?
      scoped = scoped.where{name.matches "%#{params[:name]}%"}
    end

    if params[:bedroom_count].present?
      scoped = scoped.where{bedroom_count.gteq params[:bedroom_count]}
    end

    scoped.all
  end
end
