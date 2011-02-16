class WelcomeController < ApplicationController
  
  def index
    redirect_to places_path
  end

end
