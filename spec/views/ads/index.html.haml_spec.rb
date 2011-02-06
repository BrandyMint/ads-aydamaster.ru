require 'spec_helper'

describe "ads/index.html.haml" do
  before(:each) do
    assign(:ads, [
      stub_model(Ad,
        :user_id => "User",
        :name => "Name",
        :width => 1,
        :height => 1,
        :ad_style_id => 1,
        :state => "State",
        :link => "Link"
      ),
      stub_model(Ad,
        :user_id => "User",
        :name => "Name",
        :width => 1,
        :height => 1,
        :ad_style_id => 1,
        :state => "State",
        :link => "Link"
      )
    ])
  end

  it "renders a list of ads" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "State".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Link".to_s, :count => 2
  end
end
