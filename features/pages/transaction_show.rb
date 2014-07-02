require_relative 'base'

module Pages
  class TransactionShow < Pages::Base

    set_url 'transactions{/id}'
    set_url_matcher /transactions\/\d+/

    section :form, Pages::Sections::TransactionForm, '.form-horizontal'

  end
end
