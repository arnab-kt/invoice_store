class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :email, null: false
      t.string :first_name, limit: 255
      t.string :last_name, limit: 255
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
