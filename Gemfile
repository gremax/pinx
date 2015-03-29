source 'https://rubygems.org'
ruby File.read(File.expand_path('../.ruby-version', __FILE__)).chomp

gem 'rails',        '4.2.1'
gem 'sass-rails',   '~> 5.0'
gem 'uglifier',     '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'simple_form'

group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'rb-fsevent' if `uname` =~ /Darwin/
  gem 'capybara'
end
