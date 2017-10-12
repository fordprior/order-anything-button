# Problem
My kid's daycare is always texting me for more diapers and greek yogurt for my 2 year-old son. I wanted to give them a button to click so an order of yogurt/diapers would ship to the daycare.

# Solution
Amazon sells click-and-order "Dash" buttons for certain products, but not the items I wanted. I ordered a $10 AWS IoT button on Amazon and programmed it to start/stop an EC2 instance, which would, upon every boot, run a headless browser session written in Ruby that would visit Amazon.com, log in, order the items, check out, and log out.

# Specs
1. Button: 1st gen [AWS IoT button](https://aws.amazon.com/iotbutton/), set to trigger a Lambda job (Python 2.7)
2. EC2: Ubuntu Xenial (16.04) on a t2.micro instance
3. Packages: Ruby 2.4, Selenium Webdriver, ChromDriver, Xvfb

# Steps
### Launch
1. Launch and configure EC2 Ubuntu instance to successfully run browser scripts upon boot.
      *  Use a t2.micro instance on AWS free tier
      *  Replace the default `rc.local` file with the one in this repo
      *  Add the `place_order.rb` file to the `/ubuntu/home` directory
      *  Copy the ARN to use in Step 3
2. Configure button to WiFi network.
3. Create Lambda function to boot instance, wait for scripts to run, then stop instance, and set IoT button as the trigger.
      * Instructions [here](https://aws.amazon.com/iotbutton/getting-started/)
3. Create Lambda function to boot the instance (use ARN from Step 1) and set IoT button as the trigger.
4. Click the button, wait, then check your Amazon cart. Presto!

### Stop
*  Visited Website
  1. visit website [AWS](https://aws.amazon.com/) 2. sign in and choose EC2 serice
  3. check instance
  4. click acions -> instance state -> stop

*  AWS-CLI
  1. install aw-cli
  2. run `aws ec2 stop-instances --instance-ids <id>`


# Contribution
In order to contribute, clone the repository https://github.com/fordprior/order-anything-button and create a pull request after submitting your changes
