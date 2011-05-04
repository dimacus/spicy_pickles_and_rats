Run Cucumber tests using Capybara and Selenium 2 in the Sauce cloud
============================================================
Installation
------------

    git clone http://github.com/dimacus/spicy_pickles_and_rats.git
    gem install cucumber capybara sauce
        
Config
------
Add your Sauce Labs username and api-key to env.rb



Run
---

    "rake -T" To see all the options
    "rake selenium:local_selenium" To run your suite on the local computer
    "rake selenium:sauce_selenium" To run your suite in the sauce cloud 

Detailed explanation
----
To have a step by step walkthrough of this code, checkout my blog post http://agilesoftwaretesting.com/?p=199

Questions?
----------
You can leave some questions on the blog post and I'll get back to you

Thanks
------
[Jason Huggins][1]

[Eric Allen][2]

[Sean Grove and his cucumber_sauce project on which this project was based][3]

License
-------
Released under MIT license

  [1]: http://saucelabs.com/about/team
  [2]: http://saucelabs.com/about/team
  [3]: https://github.com/sgrove/cucumber_sauce
        
