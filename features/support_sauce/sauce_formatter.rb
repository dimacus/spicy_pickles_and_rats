require 'cucumber/formatter/console'

module Cucumber
  module Formatter
    module Console
        
      def print_exception(e, status, indent)
        
        if ENV['SAUCE_USERNAME']
          http = Net::HTTP.new("saucelabs.com","80")
          url = "/rest/v1/#{ENV['SAUCE_USERNAME']}/jobs/#{ENV['SAUCE_JOB_ID']}"
          request = Net::HTTP::Put.new(url)
          request.basic_auth ENV['SAUCE_USERNAME'], ENV['SAUCE_API_KEY']
          request.body = '{"passed": false}'
          response = http.request(request)
          @io.puts "Sent failed status to Sauce"
        end
        
        @io.puts(format_string("#{e.message} (#{e.class})\n#{e.backtrace.join("\n")}".indent(indent), status))
        
      end
    end
  end  
end
