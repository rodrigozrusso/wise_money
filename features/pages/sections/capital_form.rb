module Pages
  module Sections
    class CapitalForm < Pages::Sections::CrudForm

      def fill(c)
        field_inputs[0].set c ? c.name : ''
      end

      def map_model(c)
        [c.name]
      end

    end
  end
end
