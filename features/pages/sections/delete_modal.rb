module Pages
  module Sections
    class DeleteModal < SitePrism::Section

      element :title, '.delete-modal-title'
      element :body, '.delete-modal-body'

    end
  end
end
