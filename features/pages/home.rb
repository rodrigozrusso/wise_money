require_relative 'base'
require_relative 'menu_section'

module Pages
  class Home < Pages::Base

    set_url ''
    set_url_matcher //

    section :menu, Pages::MenuSection, '#top_menu'

  end
end
