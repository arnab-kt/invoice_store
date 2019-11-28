class CreateCurrencies < ActiveRecord::Migration[6.0]
  def change
    create_table :currencies do |t|
      t.string :name, limit: 255, null: false
      t.string :code, null: false
      t.string :symbol, limit: 1, null: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
