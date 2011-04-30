Given /^I am on the Google Homepage$/ do
  visit "http://www.google.com"
end

When /^I enter a "([^\"]*)"$/ do |term|
  fill_in("q", :with => term)
  sleep 5 #Put in a wait for ajax call here instead
  click_button "Search"
  sleep 5 #Put in a wait for ajax call here instead
end

Then /^First result of search should contain "([^\"]*)"$/ do |result|
  find(:css, "li.g").text.should =~ /#{result}/i
end