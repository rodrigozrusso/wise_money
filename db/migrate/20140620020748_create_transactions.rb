class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :description, null: false, limit: 150
      t.integer :status, null: false
      t.decimal :total, :precision: 8, scale: 2
      t.date :checked_at
      t.references :income_capital, index: true
      t.references :expense_capital, index: true

      t.timestamps
    end
  end
end
