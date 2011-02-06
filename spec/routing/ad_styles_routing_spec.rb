require "spec_helper"

describe AdStylesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/ad_styles" }.should route_to(:controller => "ad_styles", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/ad_styles/new" }.should route_to(:controller => "ad_styles", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/ad_styles/1" }.should route_to(:controller => "ad_styles", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/ad_styles/1/edit" }.should route_to(:controller => "ad_styles", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/ad_styles" }.should route_to(:controller => "ad_styles", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/ad_styles/1" }.should route_to(:controller => "ad_styles", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/ad_styles/1" }.should route_to(:controller => "ad_styles", :action => "destroy", :id => "1")
    end

  end
end
