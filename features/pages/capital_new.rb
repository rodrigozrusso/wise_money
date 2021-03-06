require_relative 'base'

module Pages
  class CapitalNew < Pages::Base

    set_url 'capitals/new'
    set_url_matcher /capitals\/new/

    section :form, Pages::Sections::CapitalForm, '.form-horizontal'

  end
end
