class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #:encryptable :lockable, :timeoutable and
  devise :database_authenticatable, :registerable, :confirmable, :token_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  has_many :websites
  has_many :places, :through => :websites
  has_many :banners
  has_many :campaigns
  
end
