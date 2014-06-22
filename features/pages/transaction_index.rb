require_relative 'delete_modal_section'

module Pages
  class TransactionIndex < Pages::Base

    set_url 'transactions'
    set_url_matcher /transactions/

    elements :table_headers, 'table thead th'
    elements :transactions, 'table tbody tr'

    section :delete_modal, Pages::DeleteModalSection, '.delete-modal'

  end
end
