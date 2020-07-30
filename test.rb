require 'watir'
browser = Watir::Browser.new :firefox
browser.goto "https://form.jotform.com/201882323530347"
#browser.wait_until(browser.text.include("NEXT"))
browser.button(:id => "jfCard-welcome-start").click
browser.element(:xpath => "/html/body/div[5]/form/ul/li[1]/div/div/div[3]/button[2]").click
browser.element(:xpath => "/html/body/div[5]/form/ul/li[2]/div/div/div[3]/button[1]").click
browser.element(:xpath => "/html/body/div[5]/form/ul/li[2]/div/div/div[3]/button[2]").click