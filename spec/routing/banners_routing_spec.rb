require "spec_helper"

describe BannersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/banners" }.should route_to(:controller => "banners", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/banners/new" }.should route_to(:controller => "banners", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/banners/1" }.should route_to(:controller => "banners", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/banners/1/edit" }.should route_to(:controller => "banners", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/banners" }.should route_to(:controller => "banners", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/banners/1" }.should route_to(:controller => "banners", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/banners/1" }.should route_to(:controller => "banners", :action => "destroy", :id => "1")
    end

  end
end
