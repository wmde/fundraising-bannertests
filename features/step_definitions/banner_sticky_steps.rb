# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

And(/^I scroll to the footer$/) do
	on(ArticlePage).div_footer_element.scroll_into_view()
end

And(/^The (.*) has a concrete position on the Y-axis$/) do | banner_div_id |
	@position = on(ArticlePage).get_banner_y_position( banner_div_id )
end

Then(/^The (.*) should move its position on the Y-axis downwards$/) do | banner_div_id |
	expect(on(ArticlePage).get_banner_y_position( banner_div_id ) > @position).to be true
end

Then(/^The (.*) should have the same position on the Y\-axis$/) do | banner_div_id |
	expect(on(ArticlePage).get_banner_y_position( banner_div_id ) == @position).to be true
end