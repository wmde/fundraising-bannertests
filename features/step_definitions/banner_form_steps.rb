
And(/^I click the regularly interval option$/) do
  on(ArticlePage).get_element( 'interval_multiple' ).click
end

Then(/^Regularly details shows$/) do
  expect(on(ArticlePage).get_element( 'interval1' ).visible?).to be true
end

And(/^I click the (.*) banner (deposit|credit|debit|paypal) option$/) do | given_banner_id, option |
  on(ArticlePage).click_banner_from(given_banner_id, option)
end

Then(/^The fundraising frontend shows$/) do
  expect(on(FrontendFrontPage).div_spenden_element.visible?).to be true
end

And(/^The (deposit|credit|debit|paypal) option should be selected$/) do | option |
  if ( option == 'debit' )
    expect(on(FrontendFrontPage).radio_debit_element.selected?).to be true
  elsif ( option == 'deposit' )
    expect(on(FrontendFrontPage).radio_deposit_element.selected?).to be true
  elsif ( option == 'credit' )
    expect(on(FrontendFrontPage).radio_credit_element.selected?).to be true
  elsif ( option == 'paypal' )
    expect(on(FrontendFrontPage).radio_paypal_element.selected?).to be true
  end
end


And(/^I click the banner (.*) amount option$/) do | amount |
  on(ArticlePage).click_banner_amount( amount)
end

And(/^The (.*) amount should be selected$/) do | amount |
  if ( amount == 'amount5' )
    expect(on(FrontendFrontPage).radio_5_element.selected?).to be true
  elsif ( amount == 'amount15' )
    expect(on(FrontendFrontPage).radio_15_element.selected?).to be true
  elsif ( amount == 'amount25' )
    expect(on(FrontendFrontPage).radio_25_element.selected?).to be true
  elsif ( amount == 'amount50' )
    expect(on(FrontendFrontPage).radio_50_element.selected?).to be true
  elsif ( amount == 'amount75' )
    expect(on(FrontendFrontPage).radio_75_element.selected?).to be true
  elsif ( amount == 'amount100' )
    expect(on(FrontendFrontPage).radio_100_element.selected?).to be true
  elsif ( amount == 'amount250' )
    expect(on(FrontendFrontPage).radio_250_element.selected?).to be true
  end
end

def generate_random_amount()
  prng = Random.new
  return prng.rand(1..99999)
end

And(/^I enter an random valid amount$/) do
  @amount = generate_random_amount()
  on(ArticlePage).input_amount = @amount
end

And(/^The given amount should show$/) do
  expect(on(FrontendFrontPage).get_donation_amount_element.text).to be == "#{@amount}€"
end