ENV['RAILS_ENV'] = 'test'

require 'bundler/setup'
require 'spec_helper'
require 'action_controller/railtie'
require 'meta-rails'
require 'rspec/rails'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].sort.each { |f| require f }
