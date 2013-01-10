require 'bundler/capistrano'

set :application, "psina"
set :repository,  "git@gitbus.fiit.stuba.sk:psina/psina.git"
set :scm, :git

ssh_options[:forward_agent] = true

set :user, "ror"
set :deploy_to, "/home/#{user}/webapps/#{application}"
set :rails_env, "production"
set :use_sudo, false
server "nimbus.fiit.stuba.sk", :app, :web, :db, :primary => true

set :rvm_ruby_string, '1.9.3@psina'
before 'deploy:setup', 'rvm:install_rvm'   # install RVM
before 'deploy:setup', 'rvm:install_ruby'  # install Ruby and create gemset, or:
before 'deploy:setup', 'rvm:create_gemset' # only create gemset

require 'rvm/capistrano'

set :shared_children, shared_children << 'tmp/sockets'

namespace :deploy do
  desc "Symlink shared"
  task :symlink_shared do
    run "ln -nfs #{shared_path} #{release_path}/shared"
  end

  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after "deploy:restart", "deploy:cleanup"
after "deploy:update_code", "deploy:symlink_shared"
