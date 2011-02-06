class CampaignsController < InheritedResources::Base
  respond_to :html, :json
  actions :all
  
  # before_filter :load_website, :only => [:new, :create, :index]
#  before_filter :load_place#, :except => :index


  private

  # def load_place
  #   return @place = resource.place if resource
  #   @place = Place.find params[:campaign][:place_id] if params[:campaign][:place_id]
  # end

end
