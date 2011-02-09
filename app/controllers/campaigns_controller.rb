class CampaignsController < ApplicationController
  inherit_resources

  # belongs_to :place
  # belongs_to :banner

  respond_to :html, :json, :xml
  responders :flash, :http_cache

  before_filter :authenticate_user!

  def activate
    @campaign = Campaign.find(params[:id])
    @campaign.activate if @campaign.can_activate?

    redirect_to campaign_path(@campaign)
  end

  def pause
    @campaign = Campaign.find(params[:id])
    @campaign.pause if @campaign.can_pause?

    redirect_to campaign_path(@campaign)
  end

  def archive
    @campaign = Campaign.find(params[:id])
    @campaign.archive

    redirect_to campaign_path(@campaign)
  end

  private

  def begin_of_association_chain
    current_user
  end

end
