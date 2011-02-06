require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe WebsitesController do

  def mock_website(stubs={})
    @mock_website ||= mock_model(Website, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all websites as @websites" do
      Website.stub(:all) { [mock_website] }
      get :index
      assigns(:websites).should eq([mock_website])
    end
  end

  describe "GET show" do
    it "assigns the requested website as @website" do
      Website.stub(:find).with("37") { mock_website }
      get :show, :id => "37"
      assigns(:website).should be(mock_website)
    end
  end

  describe "GET new" do
    it "assigns a new website as @website" do
      Website.stub(:new) { mock_website }
      get :new
      assigns(:website).should be(mock_website)
    end
  end

  describe "GET edit" do
    it "assigns the requested website as @website" do
      Website.stub(:find).with("37") { mock_website }
      get :edit, :id => "37"
      assigns(:website).should be(mock_website)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created website as @website" do
        Website.stub(:new).with({'these' => 'params'}) { mock_website(:save => true) }
        post :create, :website => {'these' => 'params'}
        assigns(:website).should be(mock_website)
      end

      it "redirects to the created website" do
        Website.stub(:new) { mock_website(:save => true) }
        post :create, :website => {}
        response.should redirect_to(website_url(mock_website))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved website as @website" do
        Website.stub(:new).with({'these' => 'params'}) { mock_website(:save => false) }
        post :create, :website => {'these' => 'params'}
        assigns(:website).should be(mock_website)
      end

      it "re-renders the 'new' template" do
        Website.stub(:new) { mock_website(:save => false) }
        post :create, :website => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested website" do
        Website.stub(:find).with("37") { mock_website }
        mock_website.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :website => {'these' => 'params'}
      end

      it "assigns the requested website as @website" do
        Website.stub(:find) { mock_website(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:website).should be(mock_website)
      end

      it "redirects to the website" do
        Website.stub(:find) { mock_website(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(website_url(mock_website))
      end
    end

    describe "with invalid params" do
      it "assigns the website as @website" do
        Website.stub(:find) { mock_website(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:website).should be(mock_website)
      end

      it "re-renders the 'edit' template" do
        Website.stub(:find) { mock_website(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested website" do
      Website.stub(:find).with("37") { mock_website }
      mock_website.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the websites list" do
      Website.stub(:find) { mock_website }
      delete :destroy, :id => "1"
      response.should redirect_to(websites_url)
    end
  end

end