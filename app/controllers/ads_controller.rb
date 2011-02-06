class AdsController < ApplicationController
  respond_to :html, :json, :xml

  before_filter :authenticate_user! 
  before_filter :load_ad, :except => :index

  def index
    respond_with @ads = current_user.ads
  end

  def show
    respond_with @ad
  end

  def new
    respond_with @ad
  end

  def edit
    respond_with @ad
  end

  def create
    @ad.save
    respond_with @ad
  end

  def update
    @ad.update_attributes(params[:ad])
    respond_with @ad
  end

  def destroy
    @ad.destroy
    respond_with @ad
  end

  private

  def load_ad
    @ad = params[:id] ? current_user.ads.find(params[:id]) : current_user.ads.build(params[:ad])
  end

end
