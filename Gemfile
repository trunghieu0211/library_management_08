source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "cancancan", "~> 2.0"
gem "carrierwave", "~> 1.0"
gem "chosen-rails"
gem "ckeditor", github: "galetahub/ckeditor"
gem "coffee-rails", "~> 4.2"
gem "config", "~> 1.4"
gem "devise"
gem "ffaker"
gem "font-awesome-rails"
gem "jbuilder", "~> 2.5"
gem "jquery-rails", "~> 4.3", ">= 4.3.1"
gem "kaminari", "~> 1.1", ">= 1.1.1"
gem "mini_magick"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.6"
gem "ransack", :git => "git://github.com/ernie/ransack.git"
gem "ratyrate"
gem "sass-rails", "~> 5.0"
gem "sqlite3"
gem "toastr-rails"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
  gem "rspec-rails", "~> 3.6"
  gem "factory_bot_rails"
end

group :production do
  gem "pg"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
