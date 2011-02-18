require 'spec_helper'

describe Banner do
  VALID_IMAGE = File.new(Rails.root + 'spec/fixtures/banner_400x100.png')
  INVALID_IMAGE = File.new(Rails.root + 'spec/fixtures/banner_big.png')
  FLASH = File.new(Rails.root + 'spec/fixtures/banner_flash.swf')

  context "validations" do
    before(:all) do
    end

    before(:each) do
      @user = User.new
    end

    it "is not valid without a banner attachment" do
      Banner.new(:user_id => @user, :banner => nil).should_not be_valid
    end

    it "is not valid if banner has size more than 200 kB" do
      Banner.new(:user => @user, :banner => INVALID_IMAGE).should_not be_valid
    end

    it "is valid if banner has size less than 200 kB" do
      Banner.new(:user => @user, :banner => VALID_IMAGE).should be_valid
    end

    it "is not valid if user is not set" do
      Banner.new(:banner => VALID_IMAGE, :user => nil).should_not be_valid
    end
  end

  describe "#flash?" do
    it "returns true if attachment is flash" do
      banner = Banner.new(:banner => FLASH)
      banner.flash?.should be_true
    end

    it "returns false if attachment is not flash" do
      banner = Banner.new(:banner => VALID_IMAGE)
      banner.flash?.should be_false
    end
  end

  context "ActiveRecord callbacks" do
    it "calls #set_format and #set_name before save" do
      banner = Banner.new
      banner.should_receive(:set_format)
      banner.should_receive(:set_name)

      banner.run_callbacks(:save)
    end
  end

  describe "#set_format" do
    it "creates format from file properties" do
      banner = Factory.build(:banner_image)
      Paperclip::Geometry.should_receive(:from_file) { mock("geometry", :width => 400, :height => 100) }
      Format.should_receive(:find_or_create_by_width_and_height).with(400, 100)

      banner.set_format
    end
  end

  describe "#set_name" do
    it "uses banner filename if name not set" do
      banner = Banner.new(:name => nil)

      banner_attachment = stub("banner")
      banner.stub(:banner){ banner_attachment }
      banner_attachment.should_receive(:original_filename){ "banner_400x100.png" }

      banner.set_name
      banner.name.should == "banner_400x100.png"
    end
  end

  describe "#labeled_format" do
    before(:each) do
      @banner = Banner.new
      format = stub("format", :geometry => "400x100")
      @banner.stub(:format){ format }
    end

    it "returns widthxheight on non flash attachment" do
      @banner.labeled_format.should == "400x100"
    end

    it "adds flash tag on flash attachment" do
      @banner.stub(:flash?){ true }
      @banner.labeled_format.should == "400x100 <em>flash</em>"
    end
  end

  describe "#to_s" do
    it "return name and format" do
      banner = Banner.new
      banner.stub(:name){ "banner1" }
      banner.stub(:format){ stub("format", :to_s => "400x100") }

      banner.to_s.should == "banner1 400x100"
    end
  end

  context "scopes" do
    describe "ready scope" do
      it "returns set of objects with active state" do
        image = Factory.create(:banner_image)
        flash = Factory.create(:banner_flash)

        image.activate

        ready = Banner.ready

        ready.should include(flash)
        ready.should_not include(image)
      end
    end

    describe "live scope" do
      it "returns set of non archived objects" do
        image = Factory.create(:banner_image)
        flash = Factory.create(:banner_flash)

        flash.archive

        live = Banner.live
        live.should include(image)
        live.should_not include(flash)
      end
    end
  end
end


# == Schema Information
#
# Table name: banners
#
#  id                  :integer         not null, primary key
#  user_id             :integer         not null
#  name                :string(255)     not null
#  width               :integer         not null
#  height              :integer         not null
#  format_id           :integer
#  state               :string(255)     not null
#  link                :string(255)     default("")
#  created_at          :datetime
#  updated_at          :datetime
#  banner_file_name    :string(255)
#  banner_content_type :string(255)
#  banner_file_size    :integer
#  banner_updated_at   :datetime
#  click_count         :integer         default(0)
#  view_count          :integer         default(0)
#  last_viewed_at      :datetime
#  last_clicked_at     :datetime
#

