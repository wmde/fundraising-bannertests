# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

module URL
  def self.mediawiki_url
    url = ENV['MEDIAWIKI_URL']
    "http://#{url}"
	end
	def self.mediawiki_mobile_url
		url = ENV['MEDIAWIKI_MOBILE_URL']
		"http://#{url}"
	end
end
