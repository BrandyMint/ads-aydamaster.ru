class BannersController < ApplicationController
  respond_to :html, :json, :xml

  before_filter :authenticate_user! 
  before_filter :load_ad, :except => :index

  def index
    respond_with @banners = current_user.banners
  end

  def show
    respond_with @banner
  end

  def new
    respond_with @banner
  end

  def edit
    respond_with @banner
  end

  def create
    @banner.save
    respond_with @banner
  end

  def update
    @banner.update_attributes(params[:ad])
    respond_with @banner
  end

  def destroy
    @banner.destroy
    respond_with @banner
  end

  private

  def load_ad
    @banner = params[:id] ? current_user.banners.find(params[:id]) : current_user.banners.build(params[:ad])
  end

end
