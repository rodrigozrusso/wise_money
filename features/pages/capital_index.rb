require_relative 'crud_index'

module Pages
  class CapitalIndex < Pages::CrudIndex

    set_url 'capitals'
    set_url_matcher /capitals/

    def map_models(capitals)
      capitals.map{|c| [c.id.to_s, c.name]}
    end

    def map_model_to_delete(capital)
      "#{capital.id} - #{capital.name}"
    end

  end
end
