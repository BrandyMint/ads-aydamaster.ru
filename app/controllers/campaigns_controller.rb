# -*- coding: undecided -*-
class CampaignsController < ApplicationController
  inherit_resources

  # belongs_to :place
  # belongs_to :banner

  respond_to :html, :json, :xml
  responders :flash, :http_cache

  before_filter :authenticate_user!

  # TODO после создания редирект на площадку

  def activate
    @campaign = Campaign.find(params[:id])
    @campaign.reactivate if @campaign.can_reactivate?

    redirect_to :back
  end

  def pause
    @campaign = Campaign.find(params[:id])
    @campaign.pause if @campaign.can_pause?

    redirect_to :back
  end

  def archive
    @campaign = Campaign.find(params[:id])
    @campaign.archive

    redirect_to :back
  end

  private

  def begin_of_association_chain
    current_user
  end

end
