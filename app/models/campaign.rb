# -*- coding: utf-8 -*-
class Campaign < ActiveRecord::Base
  belongs_to :place
  belongs_to :ad

  validates_presence_of :place, :ad, :start_date

  include AASM

  aasm_column :state
  aasm_initial_state :active
  aasm_state :active     # На площадке висят баннера
  aasm_state :pause      # Ручная пауза
  aasm_state :archive    # Отработала или вручную отправили в архим
  
  def self.new(attributes = nil)
    attributes[:start_date] = Date.today
    super attributes
  end
end
