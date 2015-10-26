# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>
#
# page object for the wikimedia.de banner with form

module BannerFormModule
  include PageObject

  text_field(:input_amount, xpath: "//input[@id = 'amount_other']/following::input[1]")

  def click_banner_from(banner_div_id, option)
    if (option == 'debit')
      @browser.element(xpath: "//div[@id = \'#{banner_div_id}\']/descendant::button[contains(@class,\'send\')][1]").click
    elsif (option == 'deposit')
      @browser.element(xpath: "//div[@id = \'#{banner_div_id}\']/descendant::button[contains(@class,\'send\')][2]").click
    elsif (option == 'credit')
      @browser.element(xpath: "//div[@id = \'#{banner_div_id}\']/descendant::button[contains(@class,\'send\')][3]").click
    elsif (option == 'paypal')
      @browser.element(xpath: "//div[@id = \'#{banner_div_id}\']/descendant::button[contains(@class,\'send\')][4]").click
    end
  end

  def click_sensitive_banner_payment(option)
    if option == 'debit'
      element('button', xpath: '//tbody[@id = \'WMDE_BannerForm-payment\']/descendant::button[1]').when_visible.click
    elsif option == 'deposit'
      element('button', xpath: '//tbody[@id = \'WMDE_BannerForm-payment\']/descendant::button[2]').when_visible.click
    elsif option == 'credit'
      element('button', xpath: '//tbody[@id = \'WMDE_BannerForm-payment\']/descendant::button[3]').when_visible.click
    elsif option == 'paypal'
      element('button', xpath: '//tbody[@id = \'WMDE_BannerForm-payment\']/descendant::button[4]').when_visible.click
    end
  end

  def click_mobilebanner_from(banner_div_id, option)
    if (option == 'credit')
      @browser.element(id: "#{banner_div_id}_btn-cc").click
    elsif (option == 'paypal')
      @browser.element(id: "#{banner_div_id}_btn-ppl").click
    end
  end

  def click_banner_amount(amount)
    @browser.element(xpath: "//input[@id = \'#{amount}\']").click
  end
end
