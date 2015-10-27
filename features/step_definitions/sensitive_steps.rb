When(/^I click sensitive banner (deposit|credit|debit|paypal) option$/) do | option |
  on(ArticlePage).click_sensitive_banner_payment(option)
end

When(/^I click on the nonsepa payment option$/) do
  on(ArticlePage).get_element_by_id('debit-type-2', 'input').when_visible.click
end

When(/^I click on the address company option$/) do
  on(ArticlePage).get_element_by_id('address-type-2', 'input').when_visible.click
end

When(/^I click on the anonymous option$/) do
  on(ArticlePage).get_element_by_id('address-type-3', 'input').when_visible.click
end

When(/^I enter sensitive address data$/) do
  on(ArticlePage).get_element_by_id('first-name', 'text_field').when_visible.send_keys 'Maxe'
  on(ArticlePage).get_element_by_id('last-name', 'text_field').when_visible.send_keys 'Peter'
  on(ArticlePage).get_element_by_id('street', 'text_field').when_visible.send_keys 'Hansstrasse. 13'
  on(ArticlePage).get_element_by_id('city', 'text_field').when_visible.send_keys 'Stadtmuster'
  on(ArticlePage).get_element_by_id('post-code', 'text_field').when_visible.send_keys '12345'
  on(ArticlePage).get_element_by_id('email', 'text_field').when_visible.send_keys 'max@test.de'
end

When(/^I remove the (.*) address data$/) do |field|
  on(ArticlePage).get_element_by_id(field, 'text_field').when_visible.clear
end

When(/^I enter an invalid email$/) do
  on(ArticlePage).get_element_by_id('email', 'text_field').when_visible.clear
  on(ArticlePage).get_element_by_id('email', 'text_field').when_visible.send_keys 'super@totallyinvalidemailaddressforreal.com'
end

When(/^I enter an invalid post-code$/) do
  on(ArticlePage).get_element_by_id('post-code', 'text_field').when_visible.clear
  on(ArticlePage).get_element_by_id('post-code', 'text_field').when_visible.send_keys '123'
end

When(/^I enter valid sepa bank data$/) do
  on(ArticlePage).get_element_by_id('iban', 'text_field').when_visible.send_keys 'DE12500105170648489890'
end

When(/^I enter invalid sepa bank data$/) do
  on(ArticlePage).get_element_by_id('iban', 'text_field').when_visible.send_keys 'DE12500105170648489899'
end

When(/^I enter invalid non-sepa bank data$/) do
  on(ArticlePage).get_element_by_id('account-number', 'text_field').when_visible.send_keys '12341241244'
end

When(/^I submit the sensitive banner non-debit form by clicking the submit button$/) do
  on(ArticlePage).get_element_by_id('WMDE_BannerFullForm-finish', 'button').when_visible.click
end

When(/^I submit the sensitive banner debit form by clicking the submit button$/) do
  on(ArticlePage).get_element_by_id('WMDE_BannerFullForm-next', 'button').when_visible.click
end

When(/^I submit the sensitive banner deposit form by pressing the enter key$/) do
  on(ArticlePage).get_element_by_id('first-name', 'text_field').when_visible.send_keys :enter
end

When(/^I enter valid non-sepa bank data$/) do
  on(ArticlePage).get_element_by_id('account-number', 'text_field').when_visible.send_keys '0648489890'
  on(ArticlePage).get_element_by_id('bank-code', 'text_field').when_visible.send_keys '50010517'
end

Then(/^The sepa bank data should be filled with corresponding data$/) do
  expect(on(ArticlePage).get_element_by_id('iban', 'text_field').value).to eq 'DE12500105170648489890'
  expect(on(ArticlePage).get_element_by_id('bic', 'text_field').value).to eq 'INGDDEFFXXX'
end

Then(/^The sensitive address data should be cleared$/) do
  expect(on(ArticlePage).get_element_by_id('first-name', 'text_field').value).to eq ''
  expect(on(ArticlePage).get_element_by_id('last-name', 'text_field').value).to eq ''
  expect(on(ArticlePage).get_element_by_id('street', 'text_field').value).to eq ''
  expect(on(ArticlePage).get_element_by_id('city', 'text_field').value).to eq ''
  expect(on(ArticlePage).get_element_by_id('post-code', 'text_field').value).to eq ''
  expect(on(ArticlePage).get_element_by_id('email', 'text_field').value).to eq ''
end

Then(/^The bank data cleared$/) do
  expect(on(ArticlePage).get_element_by_id('iban', 'text_field').value).to eq ''
end

Then(/^The sepa donation part should be visible$/) do
  expect(on(ArticlePage).get_element_by_id('WMDE_Banner-sepa', 'div').when_visible).to be_visible
end

Then(/^The sepa donation part should not be visible$/) do
  expect(on(ArticlePage).get_element_by_id('WMDE_Banner-sepa', 'div').when_not_visible).not_to be_visible
end

Then(/^The nonsepa donation part should be visible$/) do
  expect(on(ArticlePage).get_element_by_id('WMDE_BannerFullForm-nosepa', 'div').when_visible).to be_visible
end

Then(/^The nonsepa donation part should not be visible$/) do
  expect(on(ArticlePage).get_element_by_id('WMDE_BannerFullForm-nosepa', 'div').when_not_visible).not_to be_visible
end

Then(/^The person donation part should be visible$/) do
  expect(on(ArticlePage).get_element_by_id('WMDE_Banner-person', 'div').when_visible).to be_visible
end

Then(/^The person donation part should not be visible$/) do
  expect(on(ArticlePage).get_element_by_id('WMDE_Banner-person', 'div').when_not_visible).not_to be_visible
end

Then(/^The company donation part should be visible$/) do
  expect(on(ArticlePage).get_element_by_id('WMDE_BannerFullForm-company', 'div').when_visible).to be_visible
end

Then(/^The company donation part should not be visible$/) do
  expect(on(ArticlePage).get_element_by_id('WMDE_BannerFullForm-company', 'div').when_not_visible).not_to be_visible
end

Then(/^The address donation part should be visible$/) do
  expect(on(ArticlePage).get_element_by_id('WMDE_Banner-address', 'div').when_visible).to be_visible
end

Then(/^The address donation part should not be visible$/) do
  expect(on(ArticlePage).get_element_by_id('WMDE_Banner-address', 'div').when_not_visible).not_to be_visible
end

Then(/^The next button should be visible$/) do
  expect(on(ArticlePage).get_element_by_id('WMDE_BannerFullForm-next', 'button').when_visible).to be_visible
end

Then(/^The next button should not be visible$/) do
  expect(on(ArticlePage).get_element_by_id('WMDE_BannerFullForm-next', 'button').when_not_visible).not_to be_visible
end

Then(/^The finish donation button should be visible$/) do
  expect(on(ArticlePage).get_element_by_id('WMDE_BannerFullForm-finish', 'button').when_visible).to be_visible
end

Then(/^The finish donation button should not be visible$/) do
  expect(on(ArticlePage).get_element_by_id('WMDE_BannerFullForm-finish', 'button').when_not_visible).not_to be_visible
end

Then(/^An (.*) error should show$/) do |field|
  expect(on(ArticlePage).get_validation_span_by_field(field).when_visible.class_name).to eq 'validation icon-bug'
end

Then(/^An (.*) error should not show$/) do |field|
  expect(on(ArticlePage).get_validation_span_by_field(field).when_visible.class_name).to eq 'validation icon-ok'
end

Then(/^The deposit confirmation page shows$/) do
  expect(on(SpendenFrontendFrontPage).div_deposit_element.when_visible).to be_visible
end


And(/^The confirmed amount should be (.*)$/) do |result_amount|
  expect(on(SpendenFrontendFrontPage).confirmed_amount_element.when_visible.text).to eq "#{result_amount}€"
end


Then(/^The credit confirmation page shows$/) do
  expect(on(SpendenFrontendFrontPage).input_holder_element.when_visible).to be_visible
end

And(/^The cardholder should be the surname and name$/) do
  expect(on(SpendenFrontendFrontPage).input_holder_element.when_visible.value).to eq 'Maxe Peter'
end


Then(/^The paypal form shows$/) do
  expect(on(SpendenFrontendFrontPage).paypal_main_element.when_visible).to be_visible
end

And(/^The paypal donation amount should show (.*) Euro$/) do |result_amount|
  expect(on(SpendenFrontendFrontPage).paypal_amount_element.when_visible.text).to eq result_amount
end
