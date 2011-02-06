require "spec_helper"

describe WebsitesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/websites" }.should route_to(:controller => "websites", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/websites/new" }.should route_to(:controller => "websites", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/websites/1" }.should route_to(:controller => "websites", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/websites/1/edit" }.should route_to(:controller => "websites", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/websites" }.should route_to(:controller => "websites", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/websites/1" }.should route_to(:controller => "websites", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/websites/1" }.should route_to(:controller => "websites", :action => "destroy", :id => "1")
    end

  end
end
