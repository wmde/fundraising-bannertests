# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>
#
# page object for the wikimedia.de banner with form

module BannerFormModule
  include PageObject

  text_field(:input_amount, xpath: "//input[@id = 'amount_other']/following::input[1]")

  def click_banner_payment_option(option)
    if option == 'debit'
      element('button', xpath: '//td[@id = \'WMDE_BannerForm-wrapper\']/descendant::button[1]').when_visible.click
    elsif option == 'deposit'
      element('button', xpath: '//td[@id = \'WMDE_BannerForm-wrapper\']/descendant::button[2]').when_visible.click
    elsif option == 'credit'
      element('button', xpath: '//td[@id = \'WMDE_BannerForm-wrapper\']/descendant::button[3]').when_visible.click
    elsif option == 'paypal'
      element('button', xpath: '//td[@id = \'WMDE_BannerForm-wrapper\']/descendant::button[4]').when_visible.click
    end
  end

  def get_validation_span_by_field(field)
    element('span', xpath: ".//*[@id='#{field}']/following::span[contains(@class, 'validation')][1]")
  end

  span(:span_confirm_amount, id: 'WMDE_BannerFullForm-confirm-amount')
  span(:span_confirm_salutation, id: 'WMDE_BannerFullForm-confirm-salutation')
  span(:span_confirm_street, id: 'WMDE_BannerFullForm-confirm-street')
  span(:span_confirm_city,  id: 'WMDE_BannerFullForm-confirm-city')
  span(:span_confirm_mail,  id: 'WMDE_BannerFullForm-confirm-mail')
  span(:span_confirm_iban,  id: 'WMDE_BannerFullForm-confirm-IBAN')
  span(:span_confirm_bic,  id: 'WMDE_BannerFullForm-confirm-BIC')

  def click_mobilebanner_from(banner_div_id, option)
    if (option == 'credit')
      @browser.element(id: "#{banner_div_id}_btn-cc").click
    elsif (option == 'paypal')
      @browser.element(id: "#{banner_div_id}_btn-ppl").click
    end
  end
end
