# @licence GNU GPL v2+
# @author Christoph Fischer

Given(/^I am on a random Wikipedia article page$/) do
  visit(ArticlePage)
end


Given(/^I am on a random Wikipedia article page and provide a (.*)$/) do | banner_code |
  on(ArticlePage).goto_random_page_banner( banner_code )
end


Then(/^The (.*) should be present$/) do | banner_div_id |
  expect(on(ArticlePage).get_element( banner_div_id ).exists?).to be true
end


When(/^I am on a long Wikipedia article page and provide a (.*)$/) do | banner_code |
  on(ArticlePage).goto_article_page_banner( 'Stausee Lipno', banner_code)
end

And(/^I start a timer$/) do
  @start_time = Time.now
end

Then(/^The (.*) should become visible$/) do |banner_div_id|
  on(ArticlePage).wait_for_banner_to_show( banner_div_id )
end

And(/^The timer should not exceed the (.*)$/) do | time_limit |
  duration = Time.now  - @start_time
  duration.should < time_limit.to_i
end


And(/^I scroll to the footer$/) do
  on(ArticlePage).div_footer_element.scroll_into_view()
end

Then(/^The (.*) should be in the field of view$/) do | banner_div_id |
  on(ArticlePage).element_in_view( banner_div_id )
end


And(/^The (.*) has a concrete position on the Y-axis$/) do | banner_div_id |
  @position = on(ArticlePage).get_banner_y_position( banner_div_id )
end

Then(/^The (.*) should move its position on the Y-axis downwards$/) do | banner_div_id |
  expect(on(ArticlePage).get_banner_y_position( banner_div_id ) > @position).to be true
end

And(/^I wait a second$/) do
  sleep(1)
end


And(/^I click the (.*) element$/) do | close_button |
  on(ArticlePage).get_element( close_button ).click
end

And(/^I click the (.*) element span$/) do | close_button |
  on(ArticlePage).get_span_by_class( close_button ).click
end

Then(/^The (.*) should hide$/) do | banner_div_id |
  expect(on(ArticlePage).get_element( banner_div_id ).visible? ).to be false
end

Then(/^The (.*) should have the same position on the Y\-axis$/) do | banner_div_id |
  expect(on(ArticlePage).get_banner_y_position( banner_div_id ) == @position).to be true
end