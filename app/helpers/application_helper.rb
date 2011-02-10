# -*- coding: utf-8 -*-
module ApplicationHelper

  def banners_in_words(banners)
    "#{banners.count} " + Russian.p( banners.count, "баннер", "баннера", "баннеров" ) if banners.present?
  end

  def button_tag(object, text, active)
    content_tag :button, :class=>"state_button #{'active' if active}", :disabled=>active do
      t text, :scope=> active ? [:states, :status] : [:states, :action]
    end.html_safe
  end

  def state_button(object, text, active)
    # На всякий случай
    # "<form action=\"#{link}\" method=\"GET\" class=\"button_form\"><input type=\"submit\" value=\"#{text}\" class=\"state_button\" #{disabled}></form>"
    if active
      button_tag(object, text, active)
    else
      link_to( button_tag(object, text, active),
               send("activate_#{object.class.name.underscore}_path", object),
               :class=>'state_link' ).html_safe
    end
  end
  
  def state_actions(object)
    content_tag :div, :class=>'state_buttons' do 
      links = ""
      links << state_button(object, 'activate', object.active?)
      links << state_button(object, 'pause', object.paused?)
      links << state_button(object, 'archive', object.archived?)
      links.html_safe
    end
  end

end
