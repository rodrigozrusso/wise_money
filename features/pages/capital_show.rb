class CapitalShow < SitePrism::Page

  set_url 'capitals{/id}'
  set_url_matcher /capitals\/\d+/

end
