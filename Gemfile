# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '2.7.1'
gem 'aasm'
gem "aws-sdk-s3", require: false
gem 'active_model_serializers'
gem 'active_storage_validations'
gem 'acts_as_favoritor'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'carmen'
gem 'browser'
gem 'cityhash' # optional, for faster hashing (C-Ruby only)
gem 'faker'
gem 'figaro'
gem 'friendly_id', '~> 5.4.0'
gem 'geocoder'
gem 'identity_cache'
gem 'jwt'
gem 'kaminari'
gem 'meta-tags'
gem 'mysql2'
gem 'puma', '~> 4.1'
gem 'pundit'
gem 'rack-cors'
gem 'rails', '~> 6.0.3', '>= 6.0.3.1'
gem 'searchkick'
gem 'sprockets', '~>3.0'
gem 'sass-rails'
gem 'sassc'
gem 'twilio-ruby'
gem 'webpacker', '~> 5.0'
gem 'rollbar'
gem 'apitome', github: 'jejacks0n/apitome'
gem 'rspec_api_documentation'
gem 'whenever', require: false
gem 'dalli'
gem 'validates_timeliness'

group :development, :test do
  gem 'pg', '>= 0.18', '< 2.0'
  # gem 'apitome', github: 'jejacks0n/apitome'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry'
  # gem 'rspec_api_documentation'
  gem 'rspec-rails'
end

group :development do
  gem 'letter_opener'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :deployment do
  gem 'capistrano', '~> 3.14.1', require: false
  gem 'capistrano-webpacker-precompile', require: false
  # gem 'capistrano-bundler' # for capistrano/bundler
  gem 'capistrano-maintenance'
  gem 'capistrano-passenger'
  gem 'capistrano-rails' # for capistrano/rails/*
  gem 'capistrano-rails-db'
  gem 'capistrano-rvm'
  gem 'capistrano-sidekiq'
  gem 'sshkit-sudo'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
