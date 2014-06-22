require_relative 'base'

module Pages
  class CapitalShow < Pages::Base

    set_url 'capitals{/id}'
    set_url_matcher /capitals\/\d+/

    elements :fields, '.form-inputs input'

  end
end
