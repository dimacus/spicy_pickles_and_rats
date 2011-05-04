require 'rubygems'
require 'cucumber/rake/task'
require 'selenium/rake/tasks'
require 'parallel'
require 'yaml'

namespace :selenium do
  Cucumber::Rake::Task.new(:local_selenium) do |t|
          t.profile = "selenium"
  end


  desc 'Run the current selenium test in cloud (pass in tag to run only that tag)'
  task :sauce_selenium do
    ENV['SAUCE_OS']              = ENV['SAUCE_OS']              ? ENV['SAUCE_OS']              : "Windows 2003"
    ENV['SAUCE_BROWSER']         = ENV['SAUCE_BROWSER']         ? ENV['SAUCE_BROWSER']         : "iehta"
    ENV['SAUCE_BROWSER_VERSION'] = ENV['SAUCE_BROWSER_VERSION'] ? ENV['SAUCE_BROWSER_VERSION'] : "7."

    ENV['SAUCE'] = "true"
    
    Cucumber::Rake::Task.new(:selenium_in_cloud ) do |t|
      t.profile = "sauce"
    end

    Rake::Task[:selenium_in_cloud].invoke
  end
end