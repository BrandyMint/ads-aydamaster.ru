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
  'pids'   => 'tmp/pids',
  'bundle' => 'vendor/bundle'
}

set :copy_configs, ['database.yml']

  
namespace :vlad do

  desc "Full deployment cycle"
  task "deploy" => %w[
      vlad:update
      vlad:copy_configs
      vlad:bundle_install
      vlad:migrate
      vlad:hoptoad
      vlad:start_app
      vlad:cleanup
    ]
end
