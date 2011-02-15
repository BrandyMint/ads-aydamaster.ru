# -*- coding: utf-8 -*-
class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new # guest user (not logged in)

    # Неавторизованным ничего не разрешаем
    return false unless user

    # Незнаю зачем это пригодится, приведено тут для примера
    # ДМ: поля admin у пользователя сейчас нет, поэтому отключаю (15.02.2010)
    # can :manage, :all if user.admin?

    can :read, Place do |place|
      place && place.user == user || user.guest_places.include?(place)
    end

    can :manage, Place do |place|
      place && place.user == user
    end

    can :manage, SharedPlace do |share|
      share && share.guest_place.user == user
    end

    # Помни:
    #   alias_action :index, :show, :to => :read
    #   alias_action :new, :to => :create
    #   alias_action :edit, :to => :update
  end
end
