require 'rubygems'
require 'bundler/setup'

require 'capybara/cucumber'
require 'capybara/spec/test_app'

Capybara.current_driver = :selenium