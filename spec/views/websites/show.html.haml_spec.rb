require 'spec_helper'

describe "websites/show.html.haml" do
  before(:each) do
    @website = assign(:website, stub_model(Website,
      :url => "Url",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
