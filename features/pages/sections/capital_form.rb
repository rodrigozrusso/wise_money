module Pages
  module Sections
    class CapitalForm < SitePrism::Section

      elements :fields, '.form-inputs input'

    end
  end
end
