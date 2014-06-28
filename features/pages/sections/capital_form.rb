module Pages
  module Sections
    class CapitalForm < Pages::Sections::CrudForm

      def fill(capital)
        fields[0].set capital ? capital.name : ''
      end

    end
  end
end
