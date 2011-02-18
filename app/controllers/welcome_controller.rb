class WelcomeController < ApplicationController
  
  def index
    flash[:notice]= 'asd asdj asldj aslkdj aljd'
    redirect_to places_path if user_signed_in?
  end

end
