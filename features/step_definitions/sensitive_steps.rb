When(/^I click sensitive banner (deposit|credit|debit|paypal) option$/) do | option |
  on(ArticlePage).click_sensitive_banner_payment(option)
end

When(/^I click on the nonsepa payment option$/) do
  on(ArticlePage).get_element_by_id('debit-type-2', 'input').when_visible.click
end

When(/^I click the (private|business|anonymous) address type option$/) do |address_type|
  if address_type == 'private'
    on(ArticlePage).get_element_by_id('address-type-1', 'input').when_visible.click
  elsif address_type == 'business'
    on(ArticlePage).get_element_by_id('address-type-2', 'input').when_visible.click
  else
    on(ArticlePage).get_element_by_id('address-type-3', 'input').when_visible.click
  end
end

When(/^I enter sensitive (private|business) address data$/) do |address_type|
  if address_type == 'private'
    on(ArticlePage).get_element_by_id('first-name', 'text_field').when_visible.send_keys 'Maxe'
    on(ArticlePage).get_element_by_id('last-name', 'text_field').when_visible.send_keys 'Peter'
  else
    on(ArticlePage).get_element_by_id('company-name', 'text_field').when_visible.send_keys 'Maxe Peter GmbH & Co. KG'
  end

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

Then(/^The sensitive private address data should be cleared$/) do
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

Then(/^The finish sepa donation button should be visible$/) do
  expect(on(ArticlePage).get_element_by_id('WMDE_BannerFullForm-finish-sepa', 'button').when_visible).to be_visible
end

Then(/^The finish sepa donation button should not be visible$/) do
  expect(on(ArticlePage).get_element_by_id('WMDE_BannerFullForm-finish-sepa', 'button').when_not_visible).not_to be_visible
end

Then(/^The debit first step should be visible$/) do
  expect(on(ArticlePage).get_element_by_id('WMDE_BannerFullForm-step1', 'div').when_visible).to be_visible
end

Then(/^The debit first step should not be visible$/) do
  expect(on(ArticlePage).get_element_by_id('WMDE_BannerFullForm-step1', 'div').when_not_visible).not_to be_visible
end

Then(/^The debit secound step should be visible$/) do
  expect(on(ArticlePage).get_element_by_id('WMDE_BannerFullForm-step2', 'div').when_visible).to be_visible
end

Then(/^The debit secound step should not be visible$/) do
  expect(on(ArticlePage).get_element_by_id('WMDE_BannerFullForm-step2', 'div').when_not_visible).not_to be_visible
end

Then(/^An (.*) error should show$/) do |field|
  expect(on(ArticlePage).get_validation_span_by_field(field).when_visible.class_name).to eq 'validation icon-bug'
end

Then(/^An (.*) error should not show$/) do |field|
  expect(on(ArticlePage).get_validation_span_by_field(field).when_visible.class_name).to eq 'validation icon-ok'
end

Then(/^The deposit confirmation page shows$/) do
  expect(on(SpendenFrontendFrontPage).div_deposit_confirmation_element.when_visible).to be_visible
end


Then(/^The confirmed amount should be (.*)$/) do |result_amount|
  expect(on(SpendenFrontendFrontPage).confirmed_amount_element.when_visible.text).to eq "#{result_amount}€"
end


Then(/^The credit confirmation page shows$/) do
  expect(on(SpendenFrontendFrontPage).input_holder_element.when_visible).to be_visible
end

Then(/^The cardholder should be the surname and name$/) do
  expect(on(SpendenFrontendFrontPage).input_holder_element.when_visible.value).to eq 'Maxe Peter'
end


Then(/^The paypal form shows$/) do
  expect(on(SpendenFrontendFrontPage).paypal_main_element.when_visible).to be_visible
end

Then(/^The paypal donation amount should show (.*) Euro$/) do |result_amount|
  expect(on(SpendenFrontendFrontPage).paypal_amount_element.when_visible.text).to eq result_amount
end


When(/^I login with my paypal credentials$/) do
  on(SpendenFrontendFrontPage).paypal_login_email_element.when_visible.value = ENV['PAYPAL_USERNAME']
  on(SpendenFrontendFrontPage).paypal_login_password_element.when_visible.value = ENV['PAYPAL_PASSWORD']
  on(SpendenFrontendFrontPage).paypal_login_button_element.when_visible.click
end

When(/^I click on the paypal continue button$/) do
  on(SpendenFrontendFrontPage).paypal_continue_button_element.when_visible.click
end

When(/^I click on the paypal back button$/) do
  on(SpendenFrontendFrontPage).paypal_back_element.when_visible.click
end

Then(/^The normal donation confirmation shows$/) do
  expect(on(SpendenFrontendFrontPage).div_normal_confirmation_element.when_visible).to be_visible
end

Then(/^The sensitive (private|business) address data on the confirmation page should be the same$/) do |address_type|
  if address_type == 'private'
    expect(on(SpendenFrontendFrontPage).span_confirm_name_element.when_visible.text).to eq 'Maxe Peter'
  else
    expect(on(SpendenFrontendFrontPage).span_confirm_name_element.when_visible.text).to eq 'Maxe Peter GmbH & Co. KG'
  end
  expect(on(SpendenFrontendFrontPage).span_confirm_street_element.when_visible.text).to eq 'Hansstrasse. 13'
  expect(on(SpendenFrontendFrontPage).span_confirm_post_code_element.when_visible.text).to eq '12345'
  expect(on(SpendenFrontendFrontPage).span_confirm_city_element.when_visible.text).to eq 'Stadtmuster'
  expect(on(SpendenFrontendFrontPage).span_confirm_mail_element.when_visible.text).to eq 'max@test.de'
end

Then(/^The debit donation amount should show (.*) Euro$/) do |result_amount|
  expect(on(ArticlePage).span_confirm_amount_element.when_visible.text).to eq result_amount
end

Then(/^The sensitive (private|business) address data on the debit secound step should be the same$/) do |address_type|
  if address_type == 'private'
    expect(on(ArticlePage).span_confirm_salutation_element.when_visible.text).to eq 'Frau Maxe Peter'
  else
    expect(on(ArticlePage).span_confirm_salutation_element.when_visible.text).to eq 'Maxe Peter GmbH & Co. KG'
  end
  expect(on(ArticlePage).span_confirm_street_element.when_visible.text).to eq 'Hansstrasse. 13'
  expect(on(ArticlePage).span_confirm_city_element.when_visible.text).to eq '12345 Stadtmuster'
  expect(on(ArticlePage).span_confirm_mail_element.when_visible.text).to eq 'max@test.de'
end


When(/^I confirm the debit contract$/) do
  on(ArticlePage).get_element_by_id('confirm_sepa', 'checkbox').when_visible.click
end

When(/^I confirm the notification contract$/) do
  on(ArticlePage).get_element_by_id('confirm_shortterm', 'checkbox').when_visible.click
end

When(/^I finish the sensitive banner debit form by clicking the submit button$/) do
  on(ArticlePage).get_element_by_id('WMDE_BannerFullForm-finish-sepa', 'button').when_visible.click
end

Then(/^The debit donation confirmation shows$/) do
  expect(on(SpendenFrontendFrontPage).div_debit_confirmation_element.when_visible).to be_visible
end
