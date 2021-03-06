source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails',      '6.0.3'
gem 'aws-sdk-s3', '~> 1.83', require: false
gem 'active_storage_validations'
gem 'image_processing'
gem 'mini_magick'
gem 'rails-i18n', '~> 6.0'
gem 'bcrypt', '~> 3.1', '>= 3.1.16'
gem 'faker', '~> 2.14'
gem 'faker-japanese'
gem 'bootstrap-sass', '3.4.1'
gem 'puma'
gem 'sass-rails', '5.1.0'
gem 'webpacker', '~> 5.2', '>= 5.2.1'
gem 'turbolinks', '5.2.0'
gem 'jbuilder',   '2.9.1'
gem 'bootsnap',   '1.4.5', require: false
gem 'mail-iso-2022-jp'
gem 'ransack'
gem 'font-awesome-sass'
gem 'kaminari'

group :development, :test do
  gem 'sqlite3', '1.4.1'
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
  gem 'factory_bot_rails', '~> 6.1'
  gem 'spring-commands-rspec', '~> 1.0', '>= 1.0.4'
  gem 'shoulda-matchers', '~> 4.4', '>= 4.4.1'
  gem 'byebug',  '11.0.1', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console',           '4.0.1'
  gem 'listen', '~> 3.2', '>= 3.2.1'
  gem 'spring', '~> 2.1', '>= 2.1.1'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  gem 'capybara', '~> 3.33'
  gem 'selenium-webdriver',       '3.142.4'
  gem 'webdrivers', '~> 4.4', '>= 4.4.1'
  gem 'launchy', '~> 2.5'
  gem 'rack_session_access', '~> 0.2.0'
  gem 'rails-controller-testing'
end

group :production do
  gem 'pg'
end
