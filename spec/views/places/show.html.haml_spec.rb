require 'spec_helper'

describe "places/show.html.haml" do
  before(:each) do
    @place = assign(:place, stub_model(Place,
      :name => "Name",
      :website_id => 1,
      :ad_style_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
