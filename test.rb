require 'watir'
browser = Watir::Browser.new :firefox
browser.goto "https://form.jotform.com/201882323530347"
browser.button(:id => "jfCard-welcome-start").click
fn = browser.text_field id: 'first_3'
fn.exists?
fn.set 'John'
ln = browser.text_field id: 'last_3'
ln.exists?
ln.set 'Doe'
browser.element(:xpath => "/html/body/div[5]/form/ul/li[1]/div/div/div[3]/button[2]").click
browser.element(:xpath => "/html/body/div[5]/form/ul/li[2]/div/div/div[3]/button[2]").click
browser.element(:xpath => "/html/body/div[5]/form/ul/li[3]/div/div/div[3]/button[2]").click
browser.element(:xpath => "/html/body/div[5]/form/ul/li[4]/div/div/div[3]/button[2]").click
aw = browser.text_field id: 'input_10_field_2'
aw.exist?
aw.set 'Ivan'
browser.element(:class => "jfDropdown-chipContainer").click
browser.li(:text => 'Name of the first pet').click
browser.element(:class => "jfInput-button forSubmit form-submit-button u-right").click