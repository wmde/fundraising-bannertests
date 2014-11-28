# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

And(/^I click the regularly interval option$/) do
  on(ArticlePage).get_element('interval_multiple').click
end

Then(/^Regularly details shows$/) do
  expect(on(ArticlePage).get_element('interval1').visible?).to be true
end

And(/^I click the (.*) banner (deposit|credit|debit|paypal) option$/) do | banner_div_id, option |
  on(ArticlePage).click_banner_from(banner_div_id, option)
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
  if option == 'debit'
    expect(on(SpendenFrontendFrontPage).radio_debit_element.selected?).to be true
  elsif option == 'deposit'
    expect(on(SpendenFrontendFrontPage).radio_deposit_element.selected?).to be true
  elsif option == 'credit'
    expect(on(SpendenFrontendFrontPage).radio_credit_element.selected?).to be true
  elsif option == 'paypal'
    expect(on(SpendenFrontendFrontPage).radio_paypal_element.selected?).to be true
  end
end

And(/^I click the banner (.*) amount option$/) do | amount |
  on(ArticlePage).click_banner_amount(amount)
end

And(/^The (.*) amount should be selected$/) do | amount |
  if amount == 'amount5'
    expect(on(SpendenFrontendFrontPage).radio_5_element.selected?).to be true
  elsif amount == 'amount15'
    expect(on(SpendenFrontendFrontPage).radio_15_element.selected?).to be true
  elsif amount == 'amount25'
    expect(on(SpendenFrontendFrontPage).radio_25_element.selected?).to be true
  elsif amount == 'amount50'
    expect(on(SpendenFrontendFrontPage).radio_50_element.selected?).to be true
  elsif amount == 'amount75'
    expect(on(SpendenFrontendFrontPage).radio_75_element.selected?).to be true
  elsif amount == 'amount100'
    expect(on(SpendenFrontendFrontPage).radio_100_element.selected?).to be true
  elsif amount == 'amount250'
    expect(on(SpendenFrontendFrontPage).radio_250_element.selected?).to be true
  end
end

def generate_random_amount
  random = Random.new
  random.rand(1..99_999)
end

And(/^I enter an random valid amount$/) do
  @amount = generate_random_amount
  on(ArticlePage).input_amount = @amount
end

And(/^The (.*) amount value should show$/) do | amount |
	expect(on(SpendenFrontendFrontPage).get_donation_amount_element.text).to be == "#{amount},00"
end

And(/^The given amount should show$/) do
  expect(on(SpendenFrontendFrontPage).get_donation_amount_element.text).to be == "#{@amount}€"
end
