class BannersController < ApplicationController

  inherit_resources

  #  resource        #=> @project
  # collection      #=> @projects
  # resource_class  #=> Project

  respond_to :html, :json, :xml
  responders :flash, :http_cache

  before_filter :authenticate_user!

  # before_filter :set_user
  # belongs_to :user #, :finder => :get_user

  def activate
    @banner = Banner.find(params[:id])
    @banner.activate if @banner.can_activate?

    redirect_to :back # banner_path(@banner)
  end

  def pause
    @banner = Banner.find(params[:id])
    @banner.pause if @banner.can_pause?

    redirect_to :back # banner_path(@banner)
  end

  def archive
    @banner = Banner.find(params[:id])
    @banner.archive

    redirect_to :back # banner_path(@banner)
  end

  protected


  def collection
    @banners = Banner.live
  end

   def begin_of_association_chain
     current_user
   end

  # def set_user
  #   puts '-----------------'
  #   puts current_user
  #   params[:user_id] = current_user.id
  # end


end
