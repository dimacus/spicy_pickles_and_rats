require 'capybara'

module Sauce
  module Capybara
    class Driver < ::Capybara::Driver::Selenium
      def browser
         
         @domain = ENV['SAUCE_CAPYBARA_DOMAIN']
         
        if ENV['SAUCE_CAPYBARA_NEW_SESSION'] == "true"
          @browser.quit if @browser
          @browser = nil
        end
        
        unless @browser
          puts "Creating a new browser instance"
          @browser = Sauce::Selenium2.new(:name => ENV['SAUCE_CAPYBARA_JOB_NAME'], 
                                          :browser_url => "http://#{@domain}")
                                          
          ENV['SAUCE_CAPYBARA_NEW_SESSION'] = "false"
          
          ENV['SAUCE_JOB_ID'] = @browser.session_id
          puts "Current Scenario Link: https://saucelabs.com/jobs/#{ENV['SAUCE_JOB_ID']}"
          
          at_exit do
            @browser.quit
          end
        end
        
        @browser
      end

      private

      def url(path)
        if path =~ /^http/
          path
        else
          "http://#{@domain}#{path}"
        end
      end
    end
  end
end