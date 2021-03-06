# frozen_string_literal: true
lock '~> 3.14.1'

set :ssh_options, {
  forward_agent: true,
  user: 'admin'
}

set :deploy_user, 'admin'
set :use_sudo, false
set :rails_env, 'production'

set :pty, true
set :copy_exclude, [".git"]
set :stages, %w(staging production)
set :default_stage, "staging"
set :default_shell, '/bin/bash -l'
# set :sidekiq_default_hooks, false

SSHKit.config.command_map[:sidekiq] = "bundle exec sidekiq"
SSHKit.config.command_map[:sidekiqctl] = "bundle exec sidekiqctl"

set :application, "trueartists"
set :repo_url, "git@github.com:jwachira/trueartists.git"
set :deploy_to, "/var/www/apps/#{fetch(:application)}"
set :migration_role, :app
set :migration_command, 'db:migrate:primary'
set :conditionally_migrate, true

ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :keep_releases, 5

set :linked_files, fetch(:linked_files, []).push('config/database.yml',
  'config/storage.yml',
  'config/application.yml'
)
append :linked_files,
  'config/database.yml',
  'config/storage.yml'
  'config/application.yml'

set :linked_dirs, fetch(:linked_dirs, []).push(
  'tmp/pids',
  'tmp/cache',
  'tmp/sockets',
  'vendor/bundle',
  'bundle',
  'log',
  'public/shared'
)

set :keep_releases, 4
set :rollbar_token, '76757cd41e30488194b1cf6e2432c64d'
set :rollbar_env, fetch(:stage)
set :rollbar_role, fetch(:application)

set :rvm_ruby_version, '2.7.1@271'
set :maintenance_roles, -> { roles([:web]) }
set :maintenance_template_path, File.expand_path("../../app/views/layouts/maintenance.html.erb", __FILE__)
set :maintenance_dirname, -> { "#{current_path}/public/system" }

before "deploy:assets:precompile", "deploy:yarn_install"
namespace :deploy do
  desc "Run rake yarn install"
  task :yarn_install do
    on roles(:web) do
      within release_path do
        execute("cd #{release_path} && yarn install --silent --no-progress --no-audit --no-optional")
      end
    end
  end
end
