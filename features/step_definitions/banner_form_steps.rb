# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

And(/^I click the regularly interval option$/) do
  on(ArticlePage).get_element_by_id('interval_multiple', 'input').when_visible.click
end

When(/^I click the (monthly|quarterly|semiyearly|yearly) interval option$/) do | option |
  case option
  when 'monthly'
    on(ArticlePage).get_element_by_id('interval1', 'input').when_visible.click
  when 'quarterly'
    on(ArticlePage).get_element_by_id('interval3', 'input').when_visible.click
  when 'semiyearly'
    on(ArticlePage).get_element_by_id('interval6', 'input').when_visible.click
  when 'yearly'
    on(ArticlePage).get_element_by_id('interval12', 'input').when_visible.click
  else
  end
end

When(/^I confirm the low amount alert$/) do
  browser.alert.ok
end

When(/^The low amount alert shows$/) do
  expect(browser.alert.exists?).to be true
end

Then(/^The regularly details shows$/) do
  expect(on(ArticlePage).get_element('interval1').visible?).to be true
end

And(/^I click the banner (deposit|credit|debit|paypal) option$/) do | option |
  on(ArticlePage).click_banner_payment_option(option)
end

Then(/^The fundraising frontend shows$/) do
  on(SpendenFrontendFrontPage) do | page |
    page.wait_until do
     page.div_spenden_element.visible?
   end
  end
end

Then(/^The paypal donation page shows$/) do
  on(PaypalFrontPage) do | page |
    page.wait_until do
     page.table_content_container_element.visible?
   end
  end
end

And(/^The (deposit|credit|debit|paypal) option should be selected$/) do | option |
  case option
  when 'debit'
    expect(on(SpendenFrontendFrontPage).radio_debit_element.selected?).to be true
  when 'deposit'
    expect(on(SpendenFrontendFrontPage).radio_deposit_element.selected?).to be true
  when 'credit'
    expect(on(SpendenFrontendFrontPage).radio_credit_element.selected?).to be true
  when 'paypal'
    expect(on(SpendenFrontendFrontPage).radio_paypal_element.selected?).to be true
  else
  end
end

Then(/^The (monthly|quarterly|semiyearly|yearly) interval should be selected$/) do | option |
  case option
  when 'monthly'
    expect(on(SpendenFrontendFrontPage).get_element_by_id('interval-display', 'span').when_visible.text).to eq 'monatlich'
  when 'quarterly'
    expect(on(SpendenFrontendFrontPage).get_element_by_id('interval-display', 'span').when_visible.text).to eq 'quartalsweise'
  when 'semiyearly'
    expect(on(SpendenFrontendFrontPage).get_element_by_id('interval-display', 'span').when_visible.text).to eq 'halbjährlich'
  when 'yearly'
    expect(on(SpendenFrontendFrontPage).get_element_by_id('interval-display', 'span').when_visible.text).to eq 'jährlich'
  else
  end
end

And(/^I click the banner (.*) amount option$/) do | amount |
  on(ArticlePage).get_element_by_id(amount, 'button').when_visible.click
end

And(/^I enter an random valid amount$/) do
  @amount = Helper.generate_random_amount
  on(ArticlePage).input_amount_element.when_visible.send_keys @amount
end

And(/^The (.*) amount value should show$/) do | amount |
  expect(on(SpendenFrontendFrontPage).get_donation_amount_element.text).to be == "#{amount},00"
end

And(/^(.*) should show on the formpage as amount$/) do | amount |
  expect(on(SpendenFrontendFrontPage).get_donation_amount_element.text).to be == "#{amount}"
end

And(/^The given amount should show$/) do
  expect(on(SpendenFrontendFrontPage).get_donation_amount_element.text).to be == "#{@amount},00€"
end
