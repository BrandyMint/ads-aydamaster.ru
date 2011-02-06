require 'spec_helper'

describe "places/edit.html.haml" do
  before(:each) do
    @place = assign(:place, stub_model(Place,
      :name => "MyString",
      :website_id => 1,
      :ad_style_id => 1
    ))
  end

  it "renders the edit place form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => place_path(@place), :method => "post" do
      assert_select "input#place_name", :name => "place[name]"
      assert_select "input#place_website_id", :name => "place[website_id]"
      assert_select "input#place_ad_style_id", :name => "place[ad_style_id]"
    end
  end
end
