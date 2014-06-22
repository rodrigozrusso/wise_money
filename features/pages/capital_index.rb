require_relative 'delete_modal_section'

module Pages
  class CapitalIndex < SitePrism::Page

    set_url 'capitals'
    set_url_matcher /capitals/

    element :page_title, '.page-title'
    element :success_message, '.success-message'
    element :no_results, '.no-results'

    elements :table_headers, 'table thead th'
    elements :capitals, 'table tbody tr'

    section :delete_modal, Pages::DeleteModalSection, '.delete-modal'

  end
end
