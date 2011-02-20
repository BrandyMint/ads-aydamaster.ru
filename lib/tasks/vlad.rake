
begin
  require 'vlad'
  Vlad.load(:app=>'passenger', :scm => "git") # :app => "passenger2", 
rescue LoadError => e
  puts "Unable to load Vlad #{e}."
end
