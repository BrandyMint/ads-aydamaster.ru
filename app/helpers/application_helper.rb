module ApplicationHelper

  def state_actions(object)
    links = ""

    unless object.archived?
      links << link_to("Activate",
                       send("activate_#{object.class.name.underscore}_path", object),
                       :method => :put) unless object.active?

      links << link_to("Pause",
                       send("pause_#{object.class.name.underscore}_path", object),
                       :method => :put) unless object.paused?

      links << "&nbsp;"
      links << link_to("Archive",
                       send("archive_#{object.class.name.underscore}_path", object),
                       :method => :put)
    end

    links.html_safe
  end

end
