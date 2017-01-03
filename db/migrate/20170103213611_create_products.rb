class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :sale_price
      t.integer :reg_price
      t.string :conditions
      t.datetime :valid_from
      t.datetime :valid_til
      t.string :img_url
      t.string :description
      t.integer :offer_item
      t.integer :store_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
