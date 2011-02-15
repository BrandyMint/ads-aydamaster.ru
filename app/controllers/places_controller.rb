class PlacesController < ApplicationController
  inherit_resources

  respond_to :html, :json, :xml
  responders :flash, :http_cache

  before_filter :authenticate_user!

  def show
    @place = Place.find(params[:id])
    authorize! :read, @place
  end

  def activate
    @place = Place.find(params[:id])
    @place.reactivate if @place.can_reactivate?

    redirect_to place_path(@place)
  end

  def pause
    @place = Place.find(params[:id])
    @place.pause if @place.can_pause?

    redirect_to place_path(@place)
  end

  def archive
    @place = Place.find(params[:id])
    @place.archive

    redirect_to place_path(@place)
  end

  protected

  def begin_of_association_chain
    #   @website = current_user.websites.find(params[:website_id])
    current_user
  end
  

end
