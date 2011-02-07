class PlacesController < ApplicationController
  inherit_resources

  respond_to :html, :json, :xml
  responders :flash, :http_cache

  before_filter :authenticate_user!

  protected
  
  def begin_of_association_chain
    @website = current_user.websites.find(params[:website_id])
  end

  
end
