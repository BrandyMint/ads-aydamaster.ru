# -*- coding: utf-8 -*-
set :application, "aydamaster.ru"
set :domain, "aydamaster.ru"
set :rails_env, "production"
set :deploy_to, "/home/wwwdata/aydamaster.ru"
# set :revision,   'develop'
set :keep_releases,	3
set :repository, 'ssh://dapi.orionet.ru/home/danil/code/aydamaster.ru/.git/'

set :web_command, "sudo apache2ctl"

# for rails
set :shared_paths, {
  'log'    => 'log',
  'system' => 'public/system',
  'pids'   => 'tmp/pids',
  'bundle' => 'vendor/bundle'
}

local_link='dapi.orionet.ru:/home/danil/code/aydamaster.ru'
  
namespace :vlad do

  desc "Full deployment cycle"
  task "deploy" => %w[
      vlad:update
      vlad:migrate
      vlad:hoptoad
      vlad:cleanup
    ]

      # vlad:web:reload

  remote_task :update do
    Rake::Task['vlad:share_configs'].invoke
    Rake::Task['vlad:bundle'].invoke
  end
  
  desc "update gem's on the server"
  remote_task :update_gems do
    run "gem update --system"
  end
  
  desc "Share config files (database.yml and settings"
  remote_task :share_configs do
    puts "Share config files"
    run "cd #{current_release}/config/; scp #{local_link}/config/database.yml ." #  ; scp -r #{local_link}/config/settings* .
  end

  desc "hoptoad integration"
  remote_task :hoptoad do
     run "pwd; cd #{current_release}; echo rake hoptoad:deploy TO=#{rails_env} REVISION=#{revision} USER=`whoami` REPO=#{repository}"
  end
  
  desc "Exec bundle --deployment"
  remote_task :bundle do
    puts "Exec bundle"
    run "pwd; cd #{current_release}; bundle install --deployment --without development"
  end

end
