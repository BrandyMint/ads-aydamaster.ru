# -*- coding: utf-8 -*-
class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new # guest user (not logged in)

    # Неавторизованным ничего не разрешаем
    return false unless user

    # Незнаю зачем это пригодится, приведено тут для примера
    can :manage, :all if user.admin?

    # Помни:
    #   alias_action :index, :show, :to => :read
    #   alias_action :new, :to => :create
    #   alias_action :edit, :to => :update
  end
  
end
