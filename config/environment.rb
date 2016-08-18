# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

SCRIPT_LINES__ = {} if ENV['RAILS_ENV']=='development'