module Pages
  module Sections
    class CapitalForm < Pages::Sections::CrudForm

      def fill(capital)
        fields[0].set capital ? capital.name : ''
      end

      def map_model(capital)
        [capital.name]
      end

      def map_fields
        fields.map{|f| f.value }
      end

    end
  end
end
