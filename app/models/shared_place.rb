class SharedPlace < ActiveRecord::Base
  belongs_to :guest_place, :class_name => 'Place', :foreign_key => :place_id
  belongs_to :guest, :class_name => 'User', :foreign_key => :guest_id

  validates_presence_of :email
  validates_presence_of :place_id

  validates_uniqueness_of :email, :scope => :place_id

  before_create :set_guest
  after_create :send_notification_email

  def set_guest
    self.guest = User.find_by_email(email)
  end

  def send_notification_email
    message = Notification.place_sharing(email, guest_place, guest)
    message.deliver
  end
end
