class PlacesController < ApplicationController
  respond_to :html, :json
  
  before_filter :load_website, :only => [:new, :create, :index]
  before_filter :load_place, :except => :index

  # http://blog.plataformatec.com.br/tag/respond_with/
  #  has_scope :by_methodology
  #     @projects = apply_scopes(Project).all
  
  def show
    respond_with @place
  end

  def new
    respond_with @place
  end

  # def edit
  #   respond_with @place
  # end

  def create
    @place.save
    respond_with @place
  end

  def update
    @place.update_attributes(params[:place])
    respond_with @place
    render 'show'
  end

  def destroy
    @place.destroy
    respond_with @place
  end

  private

  def load_website
    @website = Website.find(params[:website_id])
  end

  def load_place
    return @website.places.build(params[:place]) unless params[:id]
    return @place = @website.places.find(params[:id]) if @website 
    @place = Place.find(params[:id])
    @website = @place.website
  end
end
