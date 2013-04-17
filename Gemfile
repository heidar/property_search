source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'foreman'
gem 'jquery-rails'
gem 'thin'

group :assets do
  gem 'haml'
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'therubyracer', platforms: :ruby
  gem 'uglifier'
end

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
end

group :development do
  gem 'better_errors'
end

group :test do
  gem 'capybara'
  gem 'guard-rspec'
  gem 'rb-inotify'
  gem 'zeus'
end