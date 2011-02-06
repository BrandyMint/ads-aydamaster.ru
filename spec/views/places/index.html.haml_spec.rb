require 'spec_helper'

describe "places/index.html.haml" do
  before(:each) do
    assign(:places, [
      stub_model(Place,
        :name => "Name",
        :website_id => 1,
        :ad_style_id => 1
      ),
      stub_model(Place,
        :name => "Name",
        :website_id => 1,
        :ad_style_id => 1
      )
    ])
  end

  it "renders a list of places" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
