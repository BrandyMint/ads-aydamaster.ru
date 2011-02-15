require 'spec_helper'

describe SharedPlace do
  describe "before_create" do
    it 'should call set_guest' do
      shared = SharedPlace.new
      shared.should_receive(:set_guest)

      # ДМ (15.02.2010)
      # Правильно будет писать shared.run_callback(:before_create), но в текущей
      # версии Rails присутствует баг, который не позволяет это сделать
      # https://rails.lighthouseapp.com/projects/8994/tickets/5472-unable-to-manually-run-activerecord-object-callbacks
      # Ожидается, что он будет исправлен в 3.0.5
      shared.run_callbacks(:create)
    end
  end

  describe "after_create" do
    it 'should call send_notification email' do
      shared = SharedPlace.new
      shared.should_receive(:send_notification_email)

      # TODO: Изменить на shared.run_callbacks(:after_create) в Rails 3.0.5
      shared.run_callbacks(:create)
    end
  end

  describe "#set_guest" do
    it "search user by email and sets it as guest" do
      shared = SharedPlace.new(:email => "joe@smith.com")
      user = Factory.build(:joe)
      User.should_receive(:find_by_email).with("joe@smith.com"){ user }

      shared.set_guest
      shared.guest.should == user
    end
  end

  describe "#send_notification_email" do
    pending "TODO: Add implementation"
  end
end
