# -*- coding: utf-8 -*-
class RegistrationsController < Devise::RegistrationsController

  helper Devise::OmniAuth::UrlHelpers

  # def after_sign_in_path_for
  #   redirect_to places_path
  # end
  
end
