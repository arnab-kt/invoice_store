class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :name, limit: 255
      t.string :code, limit: 2
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
