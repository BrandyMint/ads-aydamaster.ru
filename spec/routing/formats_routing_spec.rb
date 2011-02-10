require "spec_helper"

describe FormatsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/formats" }.should route_to(:controller => "formats", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/formats/new" }.should route_to(:controller => "formats", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/formats/1" }.should route_to(:controller => "formats", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/formats/1/edit" }.should route_to(:controller => "formats", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/formats" }.should route_to(:controller => "formats", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/formats/1" }.should route_to(:controller => "formats", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/formats/1" }.should route_to(:controller => "formats", :action => "destroy", :id => "1")
    end

  end
end
