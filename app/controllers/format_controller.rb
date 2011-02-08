class FormatsController < ApplicationController
  # GET /ad_styles
  # GET /ad_styles.xml
  def index
    @ad_styles = Format.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ad_styles }
    end
  end

  # GET /ad_styles/1
  # GET /ad_styles/1.xml
  def show
    @ad_style = Format.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ad_style }
    end
  end

  # GET /ad_styles/new
  # GET /ad_styles/new.xml
  def new
    @ad_style = Format.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ad_style }
    end
  end

  # GET /ad_styles/1/edit
  def edit
    @ad_style = Format.find(params[:id])
  end

  # POST /ad_styles
  # POST /ad_styles.xml
  def create
    @ad_style = Format.new(params[:ad_style])

    respond_to do |format|
      if @ad_style.save
        format.html { redirect_to(@ad_style, :notice => 'Ad style was successfully created.') }
        format.xml  { render :xml => @ad_style, :status => :created, :location => @ad_style }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ad_style.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ad_styles/1
  # PUT /ad_styles/1.xml
  def update
    @ad_style = Format.find(params[:id])

    respond_to do |format|
      if @ad_style.update_attributes(params[:ad_style])
        format.html { redirect_to(@ad_style, :notice => 'Ad style was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ad_style.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ad_styles/1
  # DELETE /ad_styles/1.xml
  def destroy
    @ad_style = Format.find(params[:id])
    @ad_style.destroy

    respond_to do |format|
      format.html { redirect_to(ad_styles_url) }
      format.xml  { head :ok }
    end
  end
end
