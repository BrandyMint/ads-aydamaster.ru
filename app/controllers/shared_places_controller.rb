class SharedPlacesController < ApplicationController
  before_filter :authenticate_user!

  def create
    if params['place_id'] && params['email']
      place = current_user.places.find(params['place_id'])
      if place
        shared_place = SharedPlace.new(:guest_place => place, :email => params['email'])
        authorize! :create, shared_place
        shared_place.save
      end
    end

    redirect_to :back
  end

  def destroy
    shared_place = SharedPlace.find(params[:id])
    authorize! :destroy, shared_place
    shared_place.destroy

    redirect_to :back
  end

end
