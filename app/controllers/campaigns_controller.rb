class CampaignsController < ApplicationController
  inherit_resources

  # belongs_to :place
  # belongs_to :banner

  respond_to :html, :json, :xml
  responders :flash, :http_cache
  
  before_filter :authenticate_user!
  
  private

  def begin_of_association_chain
    current_user
  end

end
