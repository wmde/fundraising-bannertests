# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>
#
# page object for the spenden.wikimedia.de frontpage

class SpendenFrontendFrontPage
  include PageObject

  div(:div_spenden, id: 'wrapper')

  radio_button(:radio_deposit, id: 'payment-type-1')
  radio_button(:radio_credit, id: 'payment-type-2')
  radio_button(:radio_debit, id: 'payment-type-3')
  radio_button(:radio_paypal, id: 'payment-type-4')

  radio_button(:radio_single, id: 'periode-1')
  radio_button(:radio_regularly, id: 'periode-2')

  radio_button(:radio_single, id: 'periode-1')
  radio_button(:radio_regularly, id: 'periode-2')

  radio_button(:radio_5, id: 'amount-1')
  radio_button(:radio_15, id: 'amount-2')
  radio_button(:radio_25, id: 'amount-3')
  radio_button(:radio_50, id: 'amount-4')
  radio_button(:radio_75, id: 'amount-5')
  radio_button(:radio_100, id: 'amount-6')
  radio_button(:radio_250, id: 'amount-7')

  text_field(:input_amount,  id: 'amount-8')

  def get_donation_amount_element
    @browser.element(xpath: '//span[contains(@class,\'icon-ok-sign\')]/child::strong[1]')
  end
end
