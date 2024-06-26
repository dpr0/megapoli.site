# frozen_string_literal: true

lock '3.19.1'

server 'pipiper.ru', port: 2222, roles: %w(app db web), primary: true

# set :puma_threads,    [4, 16]
# set :puma_workers,    0
# set :pty,             true
# set :deploy_via,      :remote_cache
# set :puma_bind,       "unix://#{shared_path}/tmp/sockets/puma.sock"
# set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
# set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
# set :puma_access_log, "#{release_path}/log/puma.error.log"
# set :puma_error_log,  "#{release_path}/log/puma.access.log"
# set :puma_preload_app, true
# set :puma_worker_timeout, nil
# set :puma_init_active_record, true

set :rbenv_ruby,      '3.2.1'
set :application,     'megapoli.site'
set :repo_url,        'git@github.com:dpr0/megapoli.site.git'
set :deploy_user,     'deploy'
set :linked_files,    fetch(:linked_files, []).push('config/cable.yml', 'config/database.yml', 'config/secrets.yml', 'config/master.key', 'config/credentials.yml.enc', '.env')
set :linked_dirs,     fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'tmp/session_store', 'vendor/bundle', 'public/system', 'public/uploads')
set :keep_releases,   5
set :user,            'deploy'
set :use_sudo,        false
set :stage,           :production
set :deploy_to,       "/home/#{fetch(:user)}/#{fetch(:application)}"
# set :assets_roles,    []
set :ruby_string,     '$HOME/.rbenv/bin/rbenv exec bundle exec'
set :ssh_options, {
    user: fetch(:user),
    keys: %w(~/.ssh/id_rsa),
    forward_agent: true,
    auth_methods: %w(publickey password),
    port: 2222
}

Rake::Task['deploy:assets:backup_manifest'].clear_actions

namespace :deploy do
  desc 'deploy about:3001 fractal:3002 webcam:3003'
  task :services do
    on roles(:app) do
      within current_path.to_s do
        with rails_env: fetch(:stage).to_s do
          execute :bundle, 'exec rackup -D -s puma -p 3001 app/services/about.ru   --pid /home/deploy/megapoli.site/shared/tmp/pids/about.pid'
          execute :bundle, 'exec rackup -D -s puma -p 3002 app/services/fractal.ru --pid /home/deploy/megapoli.site/shared/tmp/pids/fractal.pid'
          execute :bundle, 'exec rackup -D -s puma -p 3003 app/services/webcam.ru  --pid /home/deploy/megapoli.site/shared/tmp/pids/webcam.pid'
        end
      end
    end
  end

  desc 'Make sure local git is in sync with remote.'
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts 'WARNING: HEAD is not the same as origin/master'
        puts 'Run `git push` to sync changes.'
        exit
      end
    end
  end

  desc 'Runs rake db:seed'
  task seed: [:set_rails_env] do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'db:seed'
        end
      end
    end
  end

  desc 'start telegram bot'
  task bot: [:set_rails_env] do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'telegram:bot:poller'
        end
      end
    end
  end

  desc 'Runs rake assets:precompile'
  task :precompile do
    on roles(:app) do
      execute("cd #{fetch(:application)}/current && RAILS_ENV=production #{fetch(:ruby_string)} rake assets:precompile") if fetch(:stage) == :production
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      invoke 'deploy'
    end
  end

  before :starting, :check_revision
end
