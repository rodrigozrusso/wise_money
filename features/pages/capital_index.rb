require_relative 'base'

module Pages
  class CapitalIndex < Pages::Base

    set_url 'capitals'
    set_url_matcher /capitals/

    element :no_results, '.no-results'

    elements :table_headers, 'table thead th'
    elements :items, 'table tbody tr'

    section :delete_modal, Pages::Sections::CrudDeleteModal, '.delete-modal'

    def map_items
      items.map{|c| c.all('td')[0..-4].map{|t| t.text} }
    end

    def map_models(capitals)
      capitals.map{|c| [c.id.to_s, c.name]}
    end

    def map_model_to_delete(capital)
      "#{capital.id} - #{capital.name}"
    end

  end
end
