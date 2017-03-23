source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'sqlite3'
gem 'puma', '~> 3.0'
gem 'money-rails', '~>1'
gem 'active_model_serializers'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'faker', github: 'stympy/faker'
  gem 'pry-rails'
  gem 'factory_girl_rails'
  gem 'rails-controller-testing'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
