# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>
#
# page object for the PayPal frontpage

class PaypalFrontPage
  include PageObject

  table(:table_content_container, id: 'xptContentContainer')
end
