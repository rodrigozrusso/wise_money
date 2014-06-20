class Transaction < ActiveRecord::Base
  has_enumeration_for :status, with: TransactionStatus, required: true

  belongs_to :income_capital, class_name: 'Capital'
  belongs_to :expense_capital, class_name: 'Capital'
end
