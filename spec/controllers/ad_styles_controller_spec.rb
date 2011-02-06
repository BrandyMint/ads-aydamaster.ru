require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe AdStylesController do

  def mock_ad_style(stubs={})
    @mock_ad_style ||= mock_model(AdStyle, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all ad_styles as @ad_styles" do
      AdStyle.stub(:all) { [mock_ad_style] }
      get :index
      assigns(:ad_styles).should eq([mock_ad_style])
    end
  end

  describe "GET show" do
    it "assigns the requested ad_style as @ad_style" do
      AdStyle.stub(:find).with("37") { mock_ad_style }
      get :show, :id => "37"
      assigns(:ad_style).should be(mock_ad_style)
    end
  end

  describe "GET new" do
    it "assigns a new ad_style as @ad_style" do
      AdStyle.stub(:new) { mock_ad_style }
      get :new
      assigns(:ad_style).should be(mock_ad_style)
    end
  end

  describe "GET edit" do
    it "assigns the requested ad_style as @ad_style" do
      AdStyle.stub(:find).with("37") { mock_ad_style }
      get :edit, :id => "37"
      assigns(:ad_style).should be(mock_ad_style)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created ad_style as @ad_style" do
        AdStyle.stub(:new).with({'these' => 'params'}) { mock_ad_style(:save => true) }
        post :create, :ad_style => {'these' => 'params'}
        assigns(:ad_style).should be(mock_ad_style)
      end

      it "redirects to the created ad_style" do
        AdStyle.stub(:new) { mock_ad_style(:save => true) }
        post :create, :ad_style => {}
        response.should redirect_to(ad_style_url(mock_ad_style))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved ad_style as @ad_style" do
        AdStyle.stub(:new).with({'these' => 'params'}) { mock_ad_style(:save => false) }
        post :create, :ad_style => {'these' => 'params'}
        assigns(:ad_style).should be(mock_ad_style)
      end

      it "re-renders the 'new' template" do
        AdStyle.stub(:new) { mock_ad_style(:save => false) }
        post :create, :ad_style => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested ad_style" do
        AdStyle.stub(:find).with("37") { mock_ad_style }
        mock_ad_style.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :ad_style => {'these' => 'params'}
      end

      it "assigns the requested ad_style as @ad_style" do
        AdStyle.stub(:find) { mock_ad_style(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:ad_style).should be(mock_ad_style)
      end

      it "redirects to the ad_style" do
        AdStyle.stub(:find) { mock_ad_style(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(ad_style_url(mock_ad_style))
      end
    end

    describe "with invalid params" do
      it "assigns the ad_style as @ad_style" do
        AdStyle.stub(:find) { mock_ad_style(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:ad_style).should be(mock_ad_style)
      end

      it "re-renders the 'edit' template" do
        AdStyle.stub(:find) { mock_ad_style(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested ad_style" do
      AdStyle.stub(:find).with("37") { mock_ad_style }
      mock_ad_style.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the ad_styles list" do
      AdStyle.stub(:find) { mock_ad_style }
      delete :destroy, :id => "1"
      response.should redirect_to(ad_styles_url)
    end
  end

end