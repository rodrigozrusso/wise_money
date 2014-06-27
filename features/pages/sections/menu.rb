module Pages
  module Sections
    class Menu < SitePrism::Section

      elements :buttons, '#top-menu-links a'
      element :active_button, '#top-menu-links li.active a'

      def find_menu(menu)
        find(:link_or_button, text: menu)
      end

    end
  end
end
