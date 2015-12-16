When(/^I select yellowblue banner (deposit|credit|debit|paypal) option$/) do | option |
  if option == 'debit'
    on(ArticlePage).custom_select_helper('zahlweise', 'Lastschrift')
  elsif option == 'deposit'
    on(ArticlePage).custom_select_helper('zahlweise', 'Überweisung')
  elsif option == 'credit'
    on(ArticlePage).custom_select_helper('zahlweise', 'Kreditkarte')
  elsif option == 'paypal'
    on(ArticlePage).custom_select_helper('zahlweise', 'Paypal')
  end
end

When(/^I select the yellowblue banner (.*) amount option$/) do |amount|
  on(ArticlePage).custom_select_helper('amount_select', amount)
end

When(/^I click the yellowblue banner submit button$/) do
  on(ArticlePage).get_element_by_id('WMDE_Banner_formsubmit', 'button').when_visible.click
end

When(/^I enter an random valid amount in the yellowblue other amount field$/) do
  @amount = Helper.generate_random_amount
  on(ArticlePage).get_element_by_id('amount-other-input', 'input').when_visible.send_keys @amount
end

When(/^I click the yellowblue regularly interval option$/) do
  on(ArticlePage).get_element_by_id('interval_multiple', 'button').when_visible.click
end

When(/^I click the yellowblue (monthly|quarterly|semiyearly|yearly) interval option$/) do | option |
  if option == 'monthly'
    on(ArticlePage).get_element_by_id('interval1', 'button').when_visible.click
  elsif option == 'quarterly'
    on(ArticlePage).get_element_by_id('interval3', 'button').when_visible.click
  elsif option == 'semiyearly'
    on(ArticlePage).get_element_by_id('interval6', 'button').when_visible.click
  elsif option == 'yearly'
    on(ArticlePage).get_element_by_id('interval12', 'button').when_visible.click
  end
end

Then(/^The yellowblue other amount field should show$/) do
  expect(on(ArticlePage).get_element_by_id('amount-other-input', 'input').when_visible).to be_visible
end

Then(/^The yellowblue regularly details should show$/) do
  expect(on(ArticlePage).get_element_by_id('interval1', 'button').when_visible).to be_visible
  expect(on(ArticlePage).get_element_by_id('interval3', 'button').when_visible).to be_visible
  expect(on(ArticlePage).get_element_by_id('interval6', 'button').when_visible).to be_visible
  expect(on(ArticlePage).get_element_by_id('interval12', 'button').when_visible).to be_visible
end
