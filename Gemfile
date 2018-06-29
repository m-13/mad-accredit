source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.0'
gem 'puma', '~> 3.11'
gem 'puma_worker_killer'
gem 'pg'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'


gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap'
gem 'coffee-rails', '~> 4.2'
gem 'delayed_job_active_record'
gem 'haml'
gem 'haml-rails'
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'sendgrid-ruby'
gem 'sprockets-rails'
gem 'tabler-rubygem'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'wicked_pdf'

group :production do
  gem 'wkhtmltopdf-binary'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
