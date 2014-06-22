require_relative 'base'

module Pages
  class CapitalEdit < Pages::Base

    set_url 'capitals{/id}/edit'
    set_url_matcher /capitals\/\d+\/edit/

    section :form, Pages::Sections::CapitalForm, '.form-horizontal'

  end
end
