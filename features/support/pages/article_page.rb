
class ArticlePage
  include PageObject

  page_url URL.random_article

  div(:div_site_notice, :id => 'siteNotice')
  div(:div_central_notice, :id => 'centralNotice')


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
end





