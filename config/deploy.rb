# -*- coding: utf-8 -*-
set :application, "aydamaster.ru"
set :domain, "chebytoday.ru"
set :rails_env, "production"
set :deploy_to, "/usr/local/www/aydamaster.ru"
# set :revision,   'develop'
set :keep_releases,	3
set :repository, 'ssh://dapi.orionet.ru/home/danil/code/aydamaster.ru/.git/'

#set :web_command, "sudo /usr/local/etc/rc.d/nginx"
set :web_command, "sudo /usr/local/sbin/nginx"

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
      vlad:web:reload
      vlad:cleanup
    ]


  remote_task :update do
    Rake::Task['vlad:share_configs'].invoke
    Rake::Task['vlad:bundle'].invoke
  end
  
  # remote_task :setup do
  #   Rake::Task['vlad:update_gems'].invoke
  # end

  #
  # Fixes vlad/passenger bad latest_release path
  #
  remote_task :start_app => :fix_release
  remote_task :fix_release do
    puts "fix passenger release path"
    #set :latest_release, current_release
    set :deploy_timestamped, false # Такой метод больше понравился :)
  end

  remote_task :update_gems do
    run "sudo gem update --system"
    #run "cd #{current_release}; bundle install --deployment"
  end
  
  desc "Share config files (database.yml and settings"
  remote_task :share_configs do
    puts "Share config files"
    run "cd #{current_release}/config/; scp #{local_link}/config/database.yml ." #  ; scp -r #{local_link}/config/settings* .
  end

  #
  # Hoptoad integration
  #
  # rake hoptoad:deploy TO=#{rails_env} REVISION=#{current_revision} REPO=#{repository} USER=#{local_user}
  # rake hoptoad:deploy TO=$RAILS_ENV REVISION=`git rev-parse HEAD` USER=`whoami` REPO=`git remote -v show | cut -f 2`
  
  desc "Exec bundle --deployment"
  remote_task :bundle do
    puts "Exec bundle"
    run "cd #{current_release}; sudo bundle --without development --without test" # На FreeBSD только через sudo
  end

  # Fix vlad's mistake
  remote_task :migrate2, :roles => :app do
    break unless target_host == Rake::RemoteTask.hosts_for(:app).first
    
    directory = case migrate_target.to_sym
                when :current then current_path
                when :latest  then current_release
                else
                  raise(ArgumentError,
                        "unknown migration target #{migrate_target.inspect}")
                end

    run ["cd #{directory}",
         "#{rake_cmd} RAILS_ENV=#{rails_env} db:migrate #{migrate_args}"
        ].join(" && ")
  end


end
