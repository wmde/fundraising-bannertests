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
  on(ArticlePage).get_element_by_id('first-name', 'text_field').when_visible.value = 'Maxe'
  on(ArticlePage).get_element_by_id('last-name', 'text_field').when_visible.value = 'Peter'
  on(ArticlePage).get_element_by_id('street', 'text_field').when_visible.value = 'Hansstrasse. 13'
  on(ArticlePage).get_element_by_id('city', 'text_field').when_visible.value = 'Stadtmuster'
  on(ArticlePage).get_element_by_id('post-code', 'text_field').when_visible.value = '12345'
  on(ArticlePage).get_element_by_id('email', 'text_field').when_visible.value = 'max@test.de'
end

When(/^I enter valid sepa bank data$/) do
  on(ArticlePage).get_element_by_id('iban', 'text_field').when_visible.value = 'DE12500105170648489890'
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

