class WebsitesController < ApplicationController

  before_filter :authenticate_user! 

  respond_to :html, :json
  
  before_filter :load_website, :except => :index

  def index
    respond_with @websites = current_user.websites
  end

  def show
    respond_with @website
  end

  def new
    respond_with @website
  end

  def edit
    respond_with @website
  end

  def create
    @website.save
    respond_with @website
  end

  def update
    @website.update_attributes(params[:website])
    respond_with @website
  end

  def destroy
    @website.destroy
    respond_with @website
  end

  private

  def load_website
    @website = params[:id] ? current_user.websites.find(params[:id]) : current_user.websites.build(params[:website])
  end
end
