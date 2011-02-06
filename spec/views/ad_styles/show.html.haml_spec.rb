require 'spec_helper'

describe "ad_styles/show.html.haml" do
  before(:each) do
    @ad_style = assign(:ad_style, stub_model(AdStyle,
      :width => 1,
      :height => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
