require_relative 'base'

module Pages
  class CapitalEdit < Pages::Base

    set_url 'capitals{/id}/edit'
    set_url_matcher /capitals\/\d+\/edit/

    elements :fields, '.form-inputs input'

  end
end
