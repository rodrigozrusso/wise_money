module Pages
  module Sections
    class CapitalForm < SitePrism::Section

      elements :fields, '.form-inputs input'
      elements :field_groups_with_error, '.form-inputs .has-error'

      def fill(capital)
        fields[0].set capital.name
      end

      def validation_messages
        field_groups_with_error.map do |field_group|
          "#{field_group.find('label').text} #{field_group.find('span').text}"
        end
      end

    end
  end
end
