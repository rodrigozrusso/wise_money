require_relative 'base'

module Pages
  class CapitalShow < Pages::Base

    set_url 'capitals{/id}'
    set_url_matcher /capitals\/\d+/

    section :form, Pages::Sections::CapitalForm, '.form-horizontal'

  end
end
