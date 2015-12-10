# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>
#
# page object for the spenden.wikimedia.de frontpage

class SpendenFrontendFrontPage
  include PageObject
  include Helper

  div(:div_spenden, id: 'wrapper')
  div(:div_debit_confirmation, id: 'debit-donation-confirmation')
  div(:div_normal_confirmation, id: 'normal-donation-confirmation')
  div(:div_deposit_confirmation, id: 'deposit-donation-confirmation')

  in_iframe({ id: 'micropayment-portal' }) do |mcp_frame|
    text_field(:input_holder, id: 'holder', frame: mcp_frame)
    text_field(:input_card_number, id: 'card-number', frame: mcp_frame)
    text_field(:input_cvc_code, id: 'cvc-code', frame: mcp_frame)
  end

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

  div(:paypal_main, id: 'xptContentMain')
  span(:paypal_amount, id: 'mainTotalAmount')
  link(:paypal_back, xpath: "//input[@id = 'CONTEXT_CGI_VAR']/following::a[1]")
  text_field(:paypal_login_email, id: 'login_email')
  text_field(:paypal_login_password, id: 'login_password')
  button(:paypal_login_button, id: 'login.x')
  button(:paypal_continue_button, id: 'continue')

  span(:span_confirm_name, id: 'confirm-name')
  span(:span_confirm_street, id: 'confirm-street')
  span(:span_confirm_post_code, id: 'confirm-postcode')
  span(:span_confirm_city,  id: 'confirm-city')
  span(:span_confirm_mail,  id: 'confirm-mail')

  def get_donation_amount_element
    @browser.element(xpath: '//span[contains(@class,\'icon-ok-sign\')]/child::strong[1]')
  end

  def confirmed_amount_element
    element('strong', xpath: '//p[contains(@class,\'title\')]/child::strong[1]')
  end
end
