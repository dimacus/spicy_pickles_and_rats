require 'rubygems'
require 'bundler/setup'

require 'capybara/cucumber'
require 'capybara/spec/test_app'

Capybara.current_driver = :selenium
Capybara.server_port = 9887

if ENV['SAUCE']
  require 'sauce'
  require 'sauce/capybara'
  
  Capybara.current_driver = :sauce
  
  ENV['SAUCE_USERNAME'] = "username"
  ENV['SAUCE_API_KEY'] = "your-api-key-goes-here"
  
  Sauce.config do |c|
    c.username = ENV['SAUCE_USERNAME']
    c.access_key = ENV['SAUCE_API_KEY']    
    
    c.browsers = [
      [ENV['SAUCE_OS'], ENV['SAUCE_BROWSER'], ENV['SAUCE_BROWSER_VERSION']]
    ]
  end
  
  puts "[Connecting to Sauce OnDemand...]"
  config = Sauce::Config.new
  ENV['SAUCE_CAPYBARA_DOMAIN'] = "#{rand(10000)}.groupon.com"
  @sauce_tunnel = Sauce::Connect.new(:host => "127.0.0.1",
                                     :port => Capybara.server_port,
                                     :domain => ENV['SAUCE_CAPYBARA_DOMAIN'],
                                     :quiet => true)
  @sauce_tunnel.wait_until_ready
  puts "[Connected!]"
  
  at_exit do
    @sauce_tunnel.disconnect
  end

  Before do |scenario|    
    ENV['SAUCE_CAPYBARA_NEW_SESSION'] = "true"
    ENV['SAUCE_CAPYBARA_JOB_NAME'] = scenario.name

  end
  
end
