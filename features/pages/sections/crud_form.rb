module Pages
  module Sections
    class CrudForm < SitePrism::Section

      elements :field_inputs, '.form-inputs input'
      elements :field_selects, '.form-inputs select'
      elements :field_groups_with_error, '.form-inputs .has-error'

      def validation_messages
        field_groups_with_error.map do |field_group|
          "#{field_group.find('label').text} #{field_group.find('span').text}"
        end
      end

      def map_fields
        fields = []
        fields << field_inputs.map{|f| f.value }
        fields << field_selects.map{|f| f.find("option[value='#{f.value}']").text }
        fields.flatten
      end

      def select_by_value(select, value)
        select.find("option[value=\"#{value ? value : ''}\"]").select_option
      end

    end
  end
end
