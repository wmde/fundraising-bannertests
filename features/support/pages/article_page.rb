# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>
#
# page object for the wikipedia article page

class ArticlePage
  include PageObject
  include Helper
  include BannerModule
  include BannerFormModule

  page_url URL.mediawiki_url

  div(:div_footer, id: 'footer')
end
