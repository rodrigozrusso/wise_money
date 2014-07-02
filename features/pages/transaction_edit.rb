require_relative 'base'

module Pages
  class TransactionEdit < Pages::Base

    set_url 'transactions{/id}/edit'
    set_url_matcher /transactions\/\d+\/edit/

    section :form, Pages::Sections::TransactionForm, '.form-horizontal'

  end
end
