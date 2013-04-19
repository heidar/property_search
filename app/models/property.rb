class Property < ActiveRecord::Base
  attr_accessible :bedroom_count, :latitude, :longitude, :name
  reverse_geocoded_by :latitude, :longitude, units: :km
  after_validation :reverse_geocode

  def self.filter_by_params params
    scoped = self.scoped
    
    if params[:name].present?
      scoped = scoped.where{name.matches "%#{params[:name]}%"}
    end

    if params[:bedroom_count].present?
      scoped = scoped.where{bedroom_count.gteq params[:bedroom_count]}
      # TODO order by bedroom_count
    end

    if params[:similar].present?
      scoped = self.scoped.where{id.eq params[:similar]}
      property = scoped.first
      properties = property.nearbys(20)
      return properties.where{bedroom_count.gteq property.bedroom_count}
    end

    scoped.all
  end
end
