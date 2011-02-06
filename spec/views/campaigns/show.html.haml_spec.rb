require 'spec_helper'

describe "campaigns/show.html.haml" do
  before(:each) do
    @campaign = assign(:campaign, stub_model(Campaign,
      :place_id => 1,
      :ad_id => 1,
      :state => "State"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/State/)
  end
end
