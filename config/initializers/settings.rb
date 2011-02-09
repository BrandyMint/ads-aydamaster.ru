Aydamaster::Application.config.after_initialize do
  Setting.collect_period = 900 unless Setting.collect_period # период сбора статистики по умолчанию - 15 минут
end
