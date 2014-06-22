require_relative 'base'

module Pages
  class Home < Pages::Base

    set_url ''
    set_url_matcher //

    section :menu, Pages::Sections::Menu, '#top_menu'

  end
end
