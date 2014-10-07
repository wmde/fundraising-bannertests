# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>
#
# page object for the wikimedia.de banners

module BannerModule
	include PageObject

	def goto_article_page_with_banner ( article_name, banner_code )
		navigate_to URL.mediawiki_url + "?title=#{article_name}&banner=#{banner_code}"
	end

	def goto_random_page_with_banner ( banner_code )
		self.goto_article_page_with_banner( 'special:random', banner_code )
	end

	def get_element ( id )
		@browser.element(id: "#{id}")
	end

	def get_span_by_class ( class_id )
		@browser.element(xpath: "//span[contains(@class,'#{class_id}')][1]")
	end

	def get_banner_y_position ( banner_div_id )
		@browser.element(id: "#{banner_div_id}").wd.location.y
	end

	def wait_for_banner_to_show ( banner_div_id )
		wait_until do
			get_element( banner_div_id ).visible?
		end
	end
end