require_relative 'delete_modal_section'

module Pages
  class CapitalIndex < SitePrism::Page

    set_url 'capitals'
    set_url_matcher /capitals/

    element :page_title, '.page-title'
    element :no_results, '.no-results'
    element :new_button, '.new-button'

    elements :table_headers, 'table thead th'
    elements :capitals, 'table tbody tr'
    elements :show_buttons, 'table tbody .show-button'
    elements :edit_buttons, 'table tbody .edit-button'
    elements :delete_buttons, 'table tbody .delete-button'

    section :delete_modal, Pages::DeleteModalSection, '.delete-modal'

  end
end
