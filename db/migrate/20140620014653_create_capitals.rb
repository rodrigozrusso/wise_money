class CreateCapitals < ActiveRecord::Migration
  def change
    create_table :capitals do |t|
      t.string :name

      t.timestamps
    end
    add_index :capitals, :name, unique: true
  end
end
