class Transaction < ActiveRecord::Base

  has_enumeration_for :status, with: TransactionStatus, required: true

  belongs_to :income_capital, class_name: 'Capital'
  belongs_to :expense_capital, class_name: 'Capital'

  validates :description, presence: true, length: {maximum: 150}

  def to_s
    "#{id} - #{description} - #{status_humanize} - #{total} - #{checked_at} - #{income_capital} - #{expense_capital}"
  end

end
