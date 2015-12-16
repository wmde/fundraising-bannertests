# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

And(/^I click the (.*) mobilebanner (credit|paypal) option$/) do | banner_div_id, option |
  if option == 'credit'
    on(ArticlePage).get_element_by_id("#{banner_div_id}_btn-cc", 'button').when_visible.click
  elsif option == 'paypal'
    on(ArticlePage).get_element_by_id("#{banner_div_id}_btn-ppl", 'button').when_visible.click
  end
end
