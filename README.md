# Problem
My kid's daycare is always texting me for more diapers and greek yogurt for my 2 year-old son. I wanted to give them a button to click so an order of yogurt/diapers would ship to the daycare. 

# Solution
Amazon sells click-and-order "Dash" buttons for certain products, but not the items I wanted. I ordered a $10 AWS IoT button on Amazon and programmed it to start/stop an EC2 instance, which would, upon every boot, run a headless browser session written in Ruby that would visit Amazon.com, log in, order the items, check out, and log out.

# Specs
1. Button: 1st gen [AWS IoT button](https://aws.amazon.com/iotbutton/), set to trigger a Lambda job (Python 2.7)
2. EC2: Ubuntu Xenial (16.04) on a t2.micro instance
3. Packages: Ruby 2.4, Selenium Webdriver, ChromDriver, Xvfb

# Steps
1. Launch and configure EC2 Ubuntu instance to successfully run browser scripts upon boot.
      *  Use a t2.micro instance on AWS free tier
      *  Replace the default `rc.local` file with the one in this repo
      *  Add the `place_order.rb` file to the `/ubuntu/home` directory
      *  Copy the ARN to use in Step 3
2. Configure button to WiFi network.
      * Instructions [here](https://aws.amazon.com/iotbutton/getting-started/)
3. Create Lambda function to boot the instance (use ARN from Step 1) and set IoT button as the trigger.
4. Click the button, wait, then check your Amazon cart. Presto!
