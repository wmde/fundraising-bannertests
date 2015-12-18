When(/^I select yellowblue banner (deposit|credit|debit|paypal) option$/) do | option |
  case option
  when 'debit'
    on(ArticlePage).custom_select_helper('zahlweise', 'Lastschrift')
  when  'deposit'
    on(ArticlePage).custom_select_helper('zahlweise', 'Überweisung')
  when  'credit'
    on(ArticlePage).custom_select_helper('zahlweise', 'Kreditkarte')
  when  'paypal'
    on(ArticlePage).custom_select_helper('zahlweise', 'Paypal')
  else
  end
end

When(/^I click the yellowblue (monthly|quarterly|semiyearly|yearly) interval option$/) do | option |
  case option
  when 'monthly'
    on(ArticlePage).get_element_by_id('interval1', 'button').when_visible.click
  when 'quarterly'
    on(ArticlePage).get_element_by_id('interval3', 'button').when_visible.click
  when 'semiyearly'
    on(ArticlePage).get_element_by_id('interval6', 'button').when_visible.click
  when 'yearly'
    on(ArticlePage).get_element_by_id('interval12', 'button').when_visible.click
    else
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

Then(/^The yellowblue other amount field should show$/) do
  expect(on(ArticlePage).get_element_by_id('amount-other-input', 'input').when_visible).to be_visible
end

Then(/^The yellowblue regularly details should show$/) do
  expect(on(ArticlePage).get_element_by_id('interval1', 'button').when_visible).to be_visible
  expect(on(ArticlePage).get_element_by_id('interval3', 'button').when_visible).to be_visible
  expect(on(ArticlePage).get_element_by_id('interval6', 'button').when_visible).to be_visible
  expect(on(ArticlePage).get_element_by_id('interval12', 'button').when_visible).to be_visible
end
