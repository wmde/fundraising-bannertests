# @licence GNU GPL v2+
# @author Christoph Fischer

class ArticlePage
  include PageObject

  page_url URL.random_article

  div(:div_site_notice, :id => 'siteNotice')
  div(:div_central_notice, :id => 'centralNotice')

  text_field(:input_amount, :xpath => "//input[@id = 'amount_other']/following::input[1]")

  div(:div_footer, :id => 'footer')

  def goto_article_page_banner ( article_name, banner_code )
    navigate_to URL.mediawiki_url + "?title=#{article_name}&banner=#{banner_code}"
  end

  def goto_random_page_banner ( banner_code )
    navigate_to URL.mediawiki_url + "?title=special:random&banner=#{banner_code}"
  end

  def get_element ( id )
    @browser.element(id: "#{id}")
  end

  def get_banner_y_position ( banner_div_id )
    @browser.element(id: "#{banner_div_id}").wd.location.y
  end

  def wait_for_banner_to_show ( banner_div_id )
    wait_until do
      get_element( banner_div_id ).visible?
    end
  end

  def click_banner_from ( banner_div_id, option  )
    if ( option == 'debit' )
      @browser.element(xpath: "//div[@id = \'#{banner_div_id}\']/descendant::button[contains(@class,\'send\')][1]").click
    elsif ( option == 'deposit' )
      @browser.element(xpath: "//div[@id = \'#{banner_div_id}\']/descendant::button[contains(@class,\'send\')][2]").click
    elsif ( option == 'credit' )
      @browser.element(xpath: "//div[@id = \'#{banner_div_id}\']/descendant::button[contains(@class,\'send\')][3]").click
    elsif ( option == 'paypal' )
      @browser.element(xpath: "//div[@id = \'#{banner_div_id}\']/descendant::button[contains(@class,\'send\')][4]").click
    end
  end

  def click_banner_amount ( amount )
    @browser.element(xpath: "//input[@id = \'#{amount}\']").click
  end
end





