module Helper
  include PageObject

  def get_element(id)
    @browser.element(id: "#{id}")
  end

  def get_element_by_id(id, type)
    element(type, id: "#{id}")
  end

  def get_element_by_xpath(xpath, type)
    element(type, xpath: xpath)
  end

  def custom_select_helper(id, selection)
    get_element_by_xpath(".//*[@id='#{id}']/following-sibling::span[1]", 'span').when_visible.click
    get_element_by_id(id, 'select').send_keys selection
    get_element_by_id(id, 'select').send_keys :enter
  end

  def get_span_by_class(class_id)
    @browser.element(xpath: "//span[contains(@class,'#{class_id}')][1]")
  end

  def self.generate_random_amount
    random = Random.new
    random.rand(1..99_999)
  end
end
