source "https://rubygems.org"

gemspec

gem "rails", "~> 5.1.4"
gem "awesome_print"
gem "pry-rails"
gem "sqlite3"

group :test do
  gem "rails-controller-testing"
  gem "simplecov", require: false
end

group :development, :test do
  gem "faker"
  gem "database_cleaner"
  gem "factory_bot_rails"
  gem "byebug"
  gem "rspec-rails"
  gem "shoulda-matchers"
  gem "rubocop", "~> 0.52.0", require: false
end
