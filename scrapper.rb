require 'selenium-webdriver'
require 'nokogiri'

imei_list=%w(013977000323877 013896000639712)

profile = Selenium::WebDriver::Firefox::Profile.new
profile.secure_ssl = true
driver = Selenium::WebDriver.for :firefox, profile: profile

imei_list.each do |imei|
	driver.get "https://selfsolve.apple.com/agreementWarrantyDynamic.do"
	
	serial_number = driver.find_element id:"sn"
	serial_number.send_keys imei
	serial_number.submit
	
	doc = Nokogiri::HTML(driver.page_source)
	if (h1=doc.css('h1').text.strip) == "We're Sorry." 
		sleep 10
		puts h1
		redo
	end
end
