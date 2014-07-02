module Pages
  module Sections
    class CapitalForm < Pages::Sections::CrudForm

      def fill(capital)
        field_inputs[0].set capital ? capital.name : ''
      end

      def map_model(capital)
        [capital.name]
      end

    end
  end
end
