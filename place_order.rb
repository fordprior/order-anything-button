require 'selenium-webdriver'
require 'headless'

@headless = Headless.new
@headless.start
@driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 10)


#Go to the Landing Page
	puts "Logging in..."
	@driver.get 'https://www.amazon.com/gp/registry/wishlist/ref=wl?ie=UTF8&requiresSignIn=1'
	wait

#Sign in
	email = @driver.find_element(:xpath, ".//*[@id='ap_email']")
	email.send_keys("username")
	wait

	password = @driver.find_element(:name, 'password')
	password.send_keys("password")
	wait

	button = @driver.find_element(:id, "signInSubmit")
	button.click
	wait

#Select item #1 
	#@driver.get 'http://a.co/egP3LLw'
	#@driver.find_element(:id, 'add-to-cart-button').click
	#puts "Adding yogurt to cart..."

#Select item #2
	@driver.get '{insert shortened URL created by "sharing" the item on Amazon.com}'
	@driver.find_element(:id, 'add-to-cart-button').click
	puts "Adding drano to cart..."

#Check out
	@driver.get 'https://www.amazon.com/gp/cart/view.html/ref=nav_cart'
	wait
	puts "#{@driver.title}"
	@driver.find_element(:name, 'proceedToCheckout').click
	wait
	@driver.find_element(:name, 'placeYourOrder1').click
	puts "Checking out..."
	puts "#{@driver.title}"

	

puts "Done! Item en route."

@driver.quit
@headless.destroy