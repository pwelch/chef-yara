source 'https://rubygems.org'

ruby '2.1.5'

group :development do
  gem 'rake'
  gem 'pry'
end

group :unit do
  gem 'berkshelf'
  gem 'chefspec', '~> 4.2'
  gem 'strainer'
end

group :integration do
  gem 'test-kitchen'
  gem 'kitchen-vagrant', '~> 0.11'
end

group :lint do
  gem 'foodcritic', '~> 4.0'
  gem 'rubocop', '~> 0.28.0'
end
