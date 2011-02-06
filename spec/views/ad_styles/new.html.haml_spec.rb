require 'spec_helper'

describe "ad_styles/new.html.haml" do
  before(:each) do
    assign(:ad_style, stub_model(AdStyle,
      :width => 1,
      :height => 1
    ).as_new_record)
  end

  it "renders new ad_style form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ad_styles_path, :method => "post" do
      assert_select "input#ad_style_width", :name => "ad_style[width]"
      assert_select "input#ad_style_height", :name => "ad_style[height]"
    end
  end
end
