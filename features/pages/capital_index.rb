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

  element :delete_modal_title, '.delete-modal-title'
  element :delete_modal_body, '.delete-modal-body'
  element :delete_modal_cancel, '.delete-modal-cancel'
  element :delete_modal_confirm, '.delete-modal-confirm'

end
