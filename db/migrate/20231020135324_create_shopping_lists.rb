class CreateShoppingLists < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.decimal :item_price
      t.integer :quantity
      t.date :expiry_date

      t.timestamps
    end
  end
end
