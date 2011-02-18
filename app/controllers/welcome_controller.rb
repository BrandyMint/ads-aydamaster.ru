class WelcomeController < ApplicationController
  
  def index
    redirect_to places_path if user_signed_in?
  end

end
