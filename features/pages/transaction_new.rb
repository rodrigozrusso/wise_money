require_relative 'base'

module Pages
  class TransactionNew < Pages::Base

    set_url 'transactions/new'
    set_url_matcher /transactions\/new/

    section :form, Pages::Sections::TransactionForm, '.form-horizontal'

  end
end
