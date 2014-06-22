module Pages
  class CapitalShow < SitePrism::Page

    set_url 'capitals{/id}'
    set_url_matcher /capitals\/\d+/

    elements :fields, '.form-inputs input'

  end
end
