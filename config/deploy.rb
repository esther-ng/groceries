# config valid only for current version of Capistrano
lock "3.7.1"

set :application, "groceries"
set :repo_url, "git@github.com:esther-ng/groceries.git"
set :deploy_to, '/home/deploy/groceries'
set :rbenv_ruby, '2.3.1'
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"

# Default value for default_env is {}
set :default_env, { path: "/home/deploy/.rbenv/plugins/ruby-build/bin:/home/deploy/.rbenv/shims:/home/deploy/.rbenv/bin:$PATH", rbenv_root: "/home/deploy/.rbenv" }

set :rbenv_roles, :all
set :rbenv_ruby_dir, '/home/deploy/.rbenv/versions/2.3.1'
set :rbenv_custom_path, '/home/deploy/.rbenv'

# Default value for keep_releases is 5
# set :keep_releases, 5
