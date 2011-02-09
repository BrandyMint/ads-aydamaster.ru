# -*- coding: utf-8 -*-
Aydamaster::Application.config.after_initialize do
  if defined? Setting

    # период сбора статистики по умолчанию - 15 минут
    Setting.collect_period = 900 unless Setting.collect_period 
  end
end
