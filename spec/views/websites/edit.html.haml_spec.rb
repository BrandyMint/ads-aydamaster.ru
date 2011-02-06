require 'spec_helper'

describe "websites/edit.html.haml" do
  before(:each) do
    @website = assign(:website, stub_model(Website,
      :url => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit website form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => website_path(@website), :method => "post" do
      assert_select "input#website_url", :name => "website[url]"
      assert_select "input#website_user_id", :name => "website[user_id]"
    end
  end
end
