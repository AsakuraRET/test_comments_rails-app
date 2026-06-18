source "https://rubygems.org"

gem "rails", "~> 8.0.0"
gem "pg", "~> 1.1"
gem "puma", "~> 8.0"

gem "sprockets-rails", "~> 3.4"
gem "importmap-rails", "~> 2.0"
gem "turbo-rails", "~> 2.0"
gem "stimulus-rails", "~> 1.3"
gem "tailwindcss-rails", "~> 3.0"
gem "jbuilder", "~> 2.13"

gem "devise", "~> 5.0"

gem "sidekiq", "~> 8.1"

gem "meilisearch", "~> 0.32.0"
gem "meilisearch-rails", "~> 0.16.0"

gem "bootsnap", "~> 1.18", require: false
gem "tzinfo-data", "~> 1.1", platforms: %i[windows jruby]

group :development, :test do
  gem "debug", "~> 1.9", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", "~> 8.0", require: false
  gem "rubocop-rails-omakase", "~> 1.0", require: false
end

group :development do
  gem "web-console", "~> 4.2"
end

group :test do
  gem "capybara", "~> 3.40"
  gem "selenium-webdriver", "~> 4.20"
end
