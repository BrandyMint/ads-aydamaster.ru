require 'spec_helper'
require 'cancan/matchers'

describe 'User permissions' do
  before(:all) do
    @owner = Factory.build(:joe)
    @guest = Factory.build(:ben)
    @place = Place.new(:user => @owner, :format => Factory.build(:format))
  end

  describe 'for Place' do
    before(:all) do
      @owner_ability = Ability.new(@owner)
    end

    context "place owner" do
      it "can perform all CRUD actions" do
        @owner_ability.should be_able_to(:manage, @place)
      end
    end

    context "guest user" do
      it "can read place" do
        @guest.stub(:guest_places){ [@place] }
        ability = Ability.new(@guest)
        ability.should be_able_to(:read, @place)
      end
    end
  end

  describe 'for SharedPlace' do
    before(:all) do
      @owner_ability = Ability.new(@owner)
    end

    context "place owner" do
      it "can manage own places" do
        shared_place = SharedPlace.new(:email => @guest.email, :guest_place => @place)
        @owner_ability.should be_able_to(:manage, shared_place)
      end
    end
  end
end
