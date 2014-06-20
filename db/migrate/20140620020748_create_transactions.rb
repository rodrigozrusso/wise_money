class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :description
      t.integer :status
      t.decimal :total
      t.datetime :checked_at
      t.references :income_capital, index: true
      t.references :expense_capital, index: true

      t.timestamps
    end
  end
end
