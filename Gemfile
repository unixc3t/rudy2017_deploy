source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'cocoon'
gem 'rake'
#gem 'pg'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
 gem 'therubyracer', platforms: :ruby
gem 'sqlite3'
gem 'whenever', require: false

gem 'bootstrap-kaminari-views'
gem 'carrierwave'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'kaminari'
gem 'mini_magick'
gem 'paperclip'
gem 'turbolinks', '~> 5'
gem 'redis','4.0.1'
gem 'redis-objects'
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'em-websocket'
gem 'bunny'
gem 'pusher'
gem 'rails-observers'
gem 'sidekiq'

group :development, :test do
  gem 'awesome_rails_console'
  gem 'awesome_print'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'pry-nav'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'selenium-webdriver'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :development do
  gem 'bullet'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
  gem 'capistrano'
  gem 'capistrano-passenger'
  gem 'capistrano-rvm'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
