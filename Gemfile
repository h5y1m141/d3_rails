ruby File.read(File.expand_path('../.ruby-version', __FILE__)).strip
source 'https://rubygems.org'
gem 'rails', '4.2.2'

# Middleware
gem 'mysql2', '~> 0.3.20'
gem 'unicorn'

# View
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'angularjs-rails'
gem 'jbuilder', '~> 2.0'
gem 'twitter-bootstrap-rails'
gem 'coffee-rails', '~> 4.1.0'

# other
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'seed-fu', '~> 2.3'

group :development do
  gem 'annotate'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano3-unicorn'
  gem 'thin'
  gem 'binding_of_caller'
  gem 'tapp'
  gem 'view_source_map'
end

group :development, :test do
  gem 'better_errors'
  gem 'hirb'
  gem 'hirb-unicode'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'quiet_assets'
  gem 'awesome_print'
  gem 'factory_girl_rails'
  gem 'teaspoon-jasmine'
  gem 'rubocop', require: false
end

group :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'shoulda-matchers', require: false
  gem 'autodoc'
  gem 'redcarpet'
end
