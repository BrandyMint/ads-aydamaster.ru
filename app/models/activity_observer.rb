# TODO: добавить пользователя, кто выполнил действие
class ActivityObserver < ActiveRecord::Observer
  observe :place, :campaign, :banner

  def after_create(subject)
    ActivityLogEntry.create(
      :subject => subject,
      :action => "create"
    )
  end

  def after_transition(subject, transition)
    ActivityLogEntry.create(
      :subject => subject,
      :action => transition.event
    )
  end
end
