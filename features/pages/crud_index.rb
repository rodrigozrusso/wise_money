require_relative 'base'

module Pages
  class CrudIndex < Pages::Base

    element :no_results, '.no-results'

    elements :table_headers, 'table thead th'
    elements :items, 'table tbody tr'

    section :delete_modal, Pages::Sections::CrudDeleteModal, '.delete-modal'

    def map_items
      items.map{|c| c.all('td')[0..-4].map{|t| t.text} }
    end

    def map_columns
      table_headers.map { |h| h.text }
    end

  end
end
