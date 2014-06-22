module Pages
  module Sections
    class CapitalForm < SitePrism::Section

      elements :fields, '.form-inputs input'

      def fill(capital)
        fields[0].set capital.name
      end

    end
  end
end
