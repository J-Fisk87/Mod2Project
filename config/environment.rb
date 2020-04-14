require 'bundler'
require 'rest-client'
require 'json'
require 'active_record'
require 'rake'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'


# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!


