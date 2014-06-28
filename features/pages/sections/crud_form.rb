module Pages
  module Sections
    class CrudForm < SitePrism::Section

      elements :fields, '.form-inputs input'
      elements :field_groups_with_error, '.form-inputs .has-error'

      def validation_messages
        field_groups_with_error.map do |field_group|
          "#{field_group.find('label').text} #{field_group.find('span').text}"
        end
      end

    end
  end
end
