# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

And(/^I click the (.*) mobilebanner (credit|paypal) option$/) do | banner_div_id, option |
  on(ArticlePage).click_mobilebanner_from(banner_div_id, option)
end