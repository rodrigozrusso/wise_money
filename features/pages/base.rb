require_relative 'sections/capital_form'
require_relative 'sections/delete_modal'
require_relative 'sections/menu'

module Pages
  class Base < SitePrism::Page

    element :page_title, '.page-title'
    element :success_message, '.success-message'

    def load(options = {})
      super options
      self
    end

  end
end
