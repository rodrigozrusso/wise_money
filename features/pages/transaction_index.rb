require_relative 'base'

module Pages
  class TransactionIndex < Pages::Base

    set_url 'transactions'
    set_url_matcher /transactions/

    element :no_results, '.no-results'

    elements :table_headers, 'table thead th'
    elements :transactions, 'table tbody tr'

    section :delete_modal, Pages::Sections::CrudDeleteModal, '.delete-modal'

  end
end
