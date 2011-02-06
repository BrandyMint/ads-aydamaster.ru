require 'spec_helper'

describe "campaigns/index.html.haml" do
  before(:each) do
    assign(:campaigns, [
      stub_model(Campaign,
        :place_id => 1,
        :ad_id => 1,
        :state => "State"
      ),
      stub_model(Campaign,
        :place_id => 1,
        :ad_id => 1,
        :state => "State"
      )
    ])
  end

  it "renders a list of campaigns" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "State".to_s, :count => 2
  end
end
