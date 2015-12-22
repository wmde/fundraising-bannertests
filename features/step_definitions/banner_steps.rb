# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Given(/^I am on the Wikipedia start page$/) do
  visit(ArticlePage)
end

When(/^I am on a random mobile Wikipedia article page and provide a (.*)$/) do | banner_code |
  on(ArticlePage).goto_random_page_with_banner(banner_code, true)
end

When(/^I am on a random Wikipedia article page and provide a (.*)$/) do | banner_code |
  on(ArticlePage).goto_random_page_with_banner(banner_code, false)
end

When(/^The (.*) banner container is visible$/) do |banner_div_id|
  on(ArticlePage).wait_for_banner_to_show(banner_div_id)
end

Then(/^The (.*) banner container should be visible$/) do |banner_div_id|
  on(ArticlePage).wait_for_banner_to_show(banner_div_id)
end

When(/^I start a timer$/) do
  @start_time = Time.now
end

When(/^I wait a second$/) do
  sleep(1)
end

When(/^I wait (\d+) seconds$/) do |seconds|
  sleep(seconds.to_i)
end

When(/^I click the banner close button/) do
  on(ArticlePage).get_element_by_id('WMDE_Banner-close', 'span').when_visible.click
end

When(/^I click the (.*) element$/) do | close_button |
  on(ArticlePage).get_element(close_button).when_visible.click
end

When(/^I click the (.*) element span$/) do | close_button |
  on(ArticlePage).get_span_by_class(close_button).click
end

When(/^I reset the hide banner cookie (.*)$/) do | cookie_name |
  cookie = "$.cookie('#{cookie_name}', null, { path: '/' });"
  browser.execute_script(cookie)
end

Then(/^The (.*) should be present$/) do | banner_div_id |
  expect(on(ArticlePage).get_element(banner_div_id).exists?).to be true
end

Then(/^The timer should not exceed the (.*)$/) do | time_limit |
  duration = Time.now - @start_time
  duration.should < time_limit.to_i
end

Then(/^The (.*) should hide$/) do | banner_div_id |
  expect(on(ArticlePage).get_element(banner_div_id).visible?).to be false
end

Then(/^The (.*) banner should not be visible/) do | banner_div_id |
  expect(on(ArticlePage).get_element_by_id(banner_div_id, 'div').when_not_visible).not_to be_visible
end

Then(/^The hide banner cookie (.*) should be set$/) do | cookie_name |
  cookie = "return $.cookie( '#{cookie_name}' );"
  expect(browser.execute_script(cookie)).to eq '1'
end
