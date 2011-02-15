class SharedPlace < ActiveRecord::Base
  belongs_to :guest_place, :class_name => 'Place', :foreign_key => :place_id
  belongs_to :guest, :class_name => 'User', :foreign_key => :guest_id

  validates_presence_of :email
  validates_presence_of :place_id

  before_create :set_guest
  after_create :send_notification_email

  def set_guest
    guest_user = User.find_by_email(email)
    guest = guest_user if guest_user
  end

  def send_notification_email
    # TODO: add code to send email
  end
end
