# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #:encryptable :lockable, :timeoutable and
  devise :database_authenticatable, :registerable, :confirmable, :token_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  has_many :websites
  has_many :places # , :through => :websites
  has_many :banners
  has_many :campaigns

  has_many :shared_places, :foreign_key => :guest_id
  has_many :guest_places, :through => :shared_places

  # Стиль отображения списка баннеров list/images

  state_machine :list_style, :initial=>:list do
    state :list
    state :images
    
    event :list do
      transition :images => :list
    end
    
    event :images do
      transition :list => :images
    end
  end
  
end


# == Schema Information
#
# Table name: users
#
#  id                   :integer         not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  reset_password_token :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer         default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  name                 :string(255)
#  confirmation_token   :string(255)
#  confirmed_at         :datetime
#  confirmation_sent_at :datetime
#  authentication_token :string(255)
#  list_style           :string(255)     default("list"), not null
#

