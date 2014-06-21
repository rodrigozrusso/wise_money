module Pages
  class DeleteModalSection < SitePrism::Section

    element :title, '.delete-modal-title'
    element :body, '.delete-modal-body'
    element :cancel_button, '.delete-modal-cancel'
    element :confirm_button, '.delete-modal-confirm'

  end
end