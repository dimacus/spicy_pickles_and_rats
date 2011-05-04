require 'cucumber/formatter/console'

module Cucumber
  module Formatter
    module Console
  
      def format_step(keyword, step_match, status, source_indent)
        comment = if source_indent
          c = (' # ' + step_match.file_colon_line + " -- OS:#{ENV['SELENIUM_BROWSER_OS']} Browser: #{ENV['SELENIUM_BROWSER_NAME']} Version: #{ENV['SELENIUM_BROWSER_VERSION']} Browser Session ID: #{ENV['BROWSER_SESSION_ID']}").indent(source_indent)
          format_string(c, :comment)
        else
          ''
        end

        format = format_for(status, :param)
        line = keyword + " " + step_match.format_args(format) + comment
        format_string(line, status)
      end
      
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
