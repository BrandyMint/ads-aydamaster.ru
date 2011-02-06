require 'spec_helper'

describe "ad_styles/edit.html.haml" do
  before(:each) do
    @ad_style = assign(:ad_style, stub_model(AdStyle,
      :width => 1,
      :height => 1
    ))
  end

  it "renders the edit ad_style form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ad_style_path(@ad_style), :method => "post" do
      assert_select "input#ad_style_width", :name => "ad_style[width]"
      assert_select "input#ad_style_height", :name => "ad_style[height]"
    end
  end
end
