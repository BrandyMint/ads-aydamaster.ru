# -*- coding: utf-8 -*-
module ApplicationHelper

  def banners_in_words(banners)
    "#{banners.count} " + Russian.p( banners.count, "баннер", "баннера", "баннеров" ) if banners.present?
  end

  def state_name(state, active)
    t state, :scope=> active ? [:states, :status] : [:states, :action]
  end

  def state_button(object, state, active)
    # На всякий случай
    # "<form action=\"#{link}\" method=\"GET\" class=\"button_form\"><input type=\"submit\" value=\"#{state}\" class=\"state_button\" #{disabled}></form>"
    css_class = 'state_button #{state}_state'
    if active
      content_tag :div, :class=>css_class do
        state_name(state, active)
      end.html_safe
    else
      link_to(
        state_name(state, active),
        send("#{state}_#{object.class.name.underscore}_path", object), :method => :put,
        :class => css_class
        ).html_safe
    end
  end

  def state_actions(object)
    content_tag :div, :class=>'state_buttons' do 
      links = ""
      links << state_button(object, 'activate', object.active?) if object.can_reactivate? || object.active?
      links << state_button(object, 'pause', object.paused?) if object.can_pause? || object.paused?
      links << state_button(object, 'archive', object.archived?) if object.can_archive? || object.archived?
      links << content_tag( :div, '', :class=>'clear' )
      links.html_safe
    end
  end

  def navigation_link( label, url, active, chosen=nil)
    chosen ||= active
    stateful_link_to(
      active,
      chosen,
      :active => proc { content_tag :li, :class=>'active' do
          link_to( label, url )
          # concat content_tag :span, label
        end },
      :chosen => proc { content_tag :li, :class=>'chosen' do
          link_to( label, url )
        end },
      :inactive => proc { content_tag :li, :class=>'ready' do
          link_to( label, url )
        end }
      )
  end


end
