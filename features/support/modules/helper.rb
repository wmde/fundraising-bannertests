module Helper
  include PageObject

  def get_element(id)
    @browser.element(id: "#{id}")
  end

  def get_element_by_id(id, type)
    element(type, id: "#{id}")
  end

  def get_span_by_class(class_id)
    @browser.element(xpath: "//span[contains(@class,'#{class_id}')][1]")
  end
end