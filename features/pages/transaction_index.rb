require_relative 'delete_modal_section'

module Pages
  class TransactionIndex < SitePrism::Page

    set_url 'transactions'
    set_url_matcher /transactions/

    element :page_title, '.page-title'
    element :no_results, '.no-results'

    elements :table_headers, 'table thead th'
    elements :transactions, 'table tbody tr'

    section :delete_modal, Pages::DeleteModalSection, '.delete-modal'

  end
end
