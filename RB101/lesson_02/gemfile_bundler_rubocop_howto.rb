# this shows how to use Gemfile and bundler to execute a specific 
# version of Rubocop without interfering with other installations.
#
# this file would be placed in the folder where the file is that you want to run Rubocop on. 
# the file should be named Gemfile

source 'https://rubygems.org'

group :development do
  gem 'rubocop', '0.86.0'
end

# in the terminal, you would navigate to the appropriate folder and run 'bundle install'
# to run rubocop on the file, run 'bundle exec rubocop file.rb'