# -*- coding: utf-8 -*-
set :application, "aydamaster.ru"
set :domain, "wwwdata@aydamaster.ru"
set :rails_env, "production"
set :deploy_to, "/home/wwwdata/aydamaster.ru"
# set :revision,   'develop'
set :keep_releases,	3
set :local_link, 'danil@dapi.orionet.ru:/home/danil/code/aydamaster.ru'

set :repository, 'ssh://danil@dapi.orionet.ru/home/danil/code/aydamaster.ru/.git/'

set :web_command, "sudo apache2ctl"

# for rails
set :shared_paths, {
  'log'    => 'log',
  'system' => 'public/system',
  # 'stylesheets' => 'public/stylesheets',
  'pids'   => 'tmp/pids',
  'bundle' => 'vendor/bundle'
}

  
namespace :vlad do

  desc "Full deployment cycle"
  task "deploy" => %w[
      vlad:update
      vlad:hoptoad
      vlad:start_app
      vlad:cleanup
    ]

  remote_task :update do
    Rake::Task['vlad:share_configs'].invoke
    Rake::Task['vlad:bundle'].invoke
    Rake::Task['vlad:migrate'].invoke
  end
  
  desc "update gem's on the server"
  remote_task :update_gems do
    run "gem update --system"
  end
  
  desc "Share config files (database.yml and settings)"
  remote_task :share_configs do
    puts "Share config files"
    run "scp #{local_link}/config/database.yml #{current_release}/config/" #  ; scp -r #{local_link}/config/settings* .
  end

  desc "hoptoad integration"
  remote_task :hoptoad do
    puts "Execute hoptoad"
    run "cd #{current_release}; rake hoptoad:deploy RAILS_ENV=production TO=#{rails_env} REVISION=#{revision} USER=`whoami` REPO=#{repository}"
  end

  desc "Execute compass"
  remote_task :compass do
    puts "Execute compass"
    run "cd #{current_release}; compass compile -e production --force"
  end
  
  desc "Execute bundle --deployment"
  remote_task :bundle do
    puts "Execute bundle"
    run "rvm rvmrc trust #{current_release} && cd #{current_release} && bundle install --deployment --without development"
  end

end
