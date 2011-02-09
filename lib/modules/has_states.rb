module HasStates
  def has_states
    # Объект может иметь три состояния: active, paused, archived
    # Из active и paused можно перейти в любой другое состояние,
    # из archived выбраться нельзя
    state_machine :state, :initial=>:active do
      state :active
      state :paused
      state :archived

      event :activate do
        transition :paused => :active
      end

      event :pause do
        transition :active => :paused
      end

      event :archive do
        transition [:active, :paused] => :archived
      end
    end
  end
end
