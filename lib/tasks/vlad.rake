if Rails.env.development?
  begin
    require 'vlad'
    Vlad.load(:app=>'passenger', :scm => :git)
  rescue LoadError => e
    puts "Unable to load Vlad #{e}."
  end
  
end
