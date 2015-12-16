When(/^I click the buttonbanner regularly interval option$/) do
  on(ArticlePage).get_element_by_id('interval_tab_multiple', 'div').when_visible.click
end

When(/^I click the buttonbanner (deposit|credit|debit|paypal) option$/) do | option |
  if option == 'debit'
    on(ArticlePage).get_element_by_xpath('.//*[@id=\'WMDE_Banner-payment\']/ul[1]/li[1]/button', 'button').when_visible.click
  elsif option == 'deposit'
    on(ArticlePage).get_element_by_xpath('.//*[@id=\'WMDE_Banner-payment\']/ul[1]/li[2]/button', 'button').when_visible.click
  elsif option == 'credit'
    on(ArticlePage).get_element_by_xpath('.//*[@id=\'WMDE_Banner-payment\']/ul[2]/li[1]/button', 'button').when_visible.click
  elsif option == 'paypal'
    on(ArticlePage).get_element_by_xpath('.//*[@id=\'WMDE_Banner-payment\']/ul[2]/li[2]/button', 'button').when_visible.click
  end
end

When(/^I click the buttonbanner (.*) amount option$/) do |amount|
  on(ArticlePage).get_element_by_id(amount, 'input').when_visible.click
end

When(/^I enter an random valid amount in the buttonbanner other amount field$/) do
  @amount = Helper.generate_random_amount
  on(ArticlePage).get_element_by_id('amount-other-input', 'input').when_visible.send_keys @amount
end

Then(/^The buttonbanner regularly details should show$/) do
  expect(on(ArticlePage).get_element_by_id('interval1', 'button').when_visible).to be_visible
  expect(on(ArticlePage).get_element_by_id('interval3', 'button').when_visible).to be_visible
  expect(on(ArticlePage).get_element_by_id('interval6', 'button').when_visible).to be_visible
  expect(on(ArticlePage).get_element_by_id('interval12', 'button').when_visible).to be_visible
end
