require_relative 'sections/crud_form'
Dir["#{File.dirname(__FILE__)}/sections/*.rb"].each {|file| require file }

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

    def message(type)
      send("#{type}_message").text.gsub(/× /, '')
    end

  end
end
