module Pages
  module Sections
    class Menu < SitePrism::Section

      element :active_button, '#top-menu-links li.active a'
      elements :buttons, '#top-menu-links a'

      def find_menu(menu)
        find(:link_or_button, text: menu)
      end

    end
  end
end
