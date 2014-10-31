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

  def click_banner_amount(amount)
    @browser.element(xpath: "//input[@id = \'#{amount}\']").click
  end
end
