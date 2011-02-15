class SharedPlacesController < ApplicationController

  def create
    if params['place_id'] && params['email']
      place = Place.find(params['place_id'])
      shared_place = SharedPlace.create(:guest_place => place, :email => params['email']) if place
    end

    redirect_to :back
  end

  def destroy
    share = SharedPlace.find(params[:id])
    share.destroy

    redirect_to :back
  end

end
