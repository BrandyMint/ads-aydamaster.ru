class PlacesController < ApplicationController
  inherit_resources

  respond_to :html, :json, :xml
  responders :flash, :http_cache

  before_filter :authenticate_user!

  def activate
    @place = Place.find(params[:id])
    @place.activate if @place.can_activate?

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

  # def begin_of_association_chain
  #   @website = current_user.websites.find(params[:website_id])
  # end


end
