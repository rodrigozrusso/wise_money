class CapitalIndex < SitePrism::Page

  set_url '/capitals'
  set_url_matcher /capitals/

  element :page_title, '.page-title'
  element :new_button, 'button.new_button'
  element :no_results, '.no-results'
  elements :table_headers, 'table thead th'
  elements :capitals, 'table tbody tr'

end
