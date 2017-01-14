Problem
My kids daycare is always texting me for more diapers and greek yogurt for my 2 year-old son. I wanted to give them a button to click so an order of yogurt/diapers would ship to the daycare. 

Solution
Amazon sells click-and-order "Dash" buttons for certain products, but not the items I wanted. I ordered a $10 AWS IoT button on Amazon and programmed it to start/stop an EC2 instance, which would, upon every boot, run a headless browser session written in Ruby that would visit Amazon.com, log in, order the items, check out, and log out.

Specs
Button: 1st gen AWS IoT button, set to trigger a Lambda job (Python 2.7)
EC2: Ubuntu Xenial (16.04) on a t2.micro instance
Packages: Ruby 2.4, Selenium Webdriver, ChromDriver, Xvfb

Steps
#Getting EC2 set up to run headless session
#Configuring button
#Lambda function