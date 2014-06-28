require_relative 'base'

module Pages
  class CapitalIndex < Pages::Base

    set_url 'capitals'
    set_url_matcher /capitals/

    element :no_results, '.no-results'

    elements :table_headers, 'table thead th'
    elements :capitals, 'table tbody tr'

    section :delete_modal, Pages::Sections::CrudDeleteModal, '.delete-modal'

  end
end
