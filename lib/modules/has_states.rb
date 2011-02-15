module HasStates
  def has_states(&block)
    state_machine :state, :initial=>:ready do
      state :ready
      state :active
      state :paused
      state :archived

      event :activate do
        transition :ready => :active
      end

      event :reactivate do
        transition :paused => :active
      end

      event :pause do
        transition :active => :paused
      end

      event :archive do
        transition [:ready, :active, :paused] => :archived
      end

      event :release do
        transition :active => :ready
      end

      self.instance_eval(&block) if block_given?
    end
  end
end
