require 'spec_helper'

describe "websites/index.html.haml" do
  before(:each) do
    assign(:websites, [
      stub_model(Website,
        :url => "Url",
        :user_id => 1
      ),
      stub_model(Website,
        :url => "Url",
        :user_id => 1
      )
    ])
  end

  it "renders a list of websites" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
