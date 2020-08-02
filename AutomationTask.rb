require 'watir'
require 'logger'
Selenium::WebDriver.logger.level = :info
Selenium::WebDriver.logger.output = 'selenium.log'
browser = Watir::Browser.new :firefox
browser.goto "https://form.jotform.com/201882323530347"

#Click on start form
browser.button(:id => "jfCard-welcome-start").click
sleep(5)


#Input first and last name and advance to next page
fn = browser.text_field id: 'first_3'
fn.exists?
fn.set 'John'
ln = browser.text_field id: 'last_3'
ln.exists?
ln.set 'Doe'
browser.send_keys :enter

#Check if attach file exists, then move to next page, if element does not exist, close the browser
if browser.element(css: '#input_9').exists?
    then browser.send_keys :enter
else browser.close
end

#Check if the signature canvas exists, move to next page, if not close browser.
sleep(5)
sig = browser.element(:id => "sig_pad_7")
if sig.exists?
    then sig.click
else browser.close
end
sigInp = browser.hidden(:id => "input_7")
clear = browser.element(xpath: "//span[text()='Clear']")
sigVal = sigInp.value
if sigVal != ''
    then browser.send_keys :enter
else clear.click
end

#Input into calendar field 
sleep(5)
browser.element(:id => "lite_mode_6").wait_until(&:exists?)
date = browser.text_field id: "lite_mode_6"
date.set '08022020'
browser.send_keys :enter

#Select question then fill in answer.
browser.element(:class => "jfDropdown-chipContainer").click
browser.li(:text => 'Name of the first pet').click
aw = browser.text_field id: 'input_10_field_2'
aw.exist?
aw.set 'Ivan'
browser.element(:class => ["jfInput-button", "forSubmit", "form-submit-button", "u-right"]).click
sleep(5)
if browser.element(:id => 'jfThankYou-type-svg').exists?
then browser.close
end