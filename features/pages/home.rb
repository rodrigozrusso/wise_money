require_relative 'menu_section'

module Pages
  class Home < SitePrism::Page

    set_url ''
    set_url_matcher //

    section :menu, Pages::MenuSection, '#top_menu'

  end
end
