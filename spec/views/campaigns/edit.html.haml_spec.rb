require 'spec_helper'

describe "campaigns/edit.html.haml" do
  before(:each) do
    @campaign = assign(:campaign, stub_model(Campaign,
      :place_id => 1,
      :ad_id => 1,
      :state => "MyString"
    ))
  end

  it "renders the edit campaign form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => campaign_path(@campaign), :method => "post" do
      assert_select "input#campaign_place_id", :name => "campaign[place_id]"
      assert_select "input#campaign_ad_id", :name => "campaign[ad_id]"
      assert_select "input#campaign_state", :name => "campaign[state]"
    end
  end
end
