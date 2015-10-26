When(/^I click sensitive banner (deposit|credit|debit|paypal) option$/) do | option |
  on(ArticlePage).click_sensitive_banner_payment(option)
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

