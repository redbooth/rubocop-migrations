$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'rubocop'
require 'rubocop/rspec/support'

project_path = File.join(File.dirname(__FILE__), '..')
Dir["#{project_path}/spec/support/**/*.rb"].each { |f| require f }

require 'rubocop/migrations'
