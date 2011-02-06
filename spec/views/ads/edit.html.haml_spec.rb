require 'spec_helper'

describe "ads/edit.html.haml" do
  before(:each) do
    @ad = assign(:ad, stub_model(Ad,
      :user_id => "MyString",
      :name => "MyString",
      :width => 1,
      :height => 1,
      :ad_style_id => 1,
      :state => "MyString",
      :link => "MyString"
    ))
  end

  it "renders the edit ad form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ad_path(@ad), :method => "post" do
      assert_select "input#ad_user_id", :name => "ad[user_id]"
      assert_select "input#ad_name", :name => "ad[name]"
      assert_select "input#ad_width", :name => "ad[width]"
      assert_select "input#ad_height", :name => "ad[height]"
      assert_select "input#ad_ad_style_id", :name => "ad[ad_style_id]"
      assert_select "input#ad_state", :name => "ad[state]"
      assert_select "input#ad_link", :name => "ad[link]"
    end
  end
end
