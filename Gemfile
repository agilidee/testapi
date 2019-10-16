source "https://rubygems.org"

gemspec

gem "rails", "~> 5.2.3"
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
  gem "rubocop", "0.73.0", require: false
  gem "rubocop-performance", "1.4.0", require: false
  gem "rubocop-rails", "2.2.1", require: false
end
