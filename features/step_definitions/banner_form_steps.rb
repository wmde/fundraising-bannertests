
And(/^I click the regularly interval option$/) do
  on(ArticlePage).get_element( 'interval_multiple' ).click
end

Then(/^Regularly details shows$/) do
  expect(on(ArticlePage).get_element( 'interval1' ).visible?).to be true
end

And(/^I click the (.*) deposit option$/) do | given_banner_id |
  on(ArticlePage).click_banner_from_deposit(given_banner_id)
  sleep(20)
end

Then(/^The fundraising frontend shows$/) do
  pending
end

And(/^The deposit option should be selected$/) do
  pending
end

