require_relative 'sections/capital_form'
require_relative 'sections/delete_modal'
require_relative 'sections/menu'

module Pages
  class Base < SitePrism::Page

    element :page_title, '.page-title'

    element :success_message, '.alert-success'
    element :warning_message, '.alert-warning'
    element :error_message, '.alert-danger'

    section :menu, Pages::Sections::Menu, '#top_menu'

    def load(options = {})
      super options
      self
    end

  end
end
