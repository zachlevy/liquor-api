class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.references :product, index: true, foreign_key: true
      t.references :store, index: true, foreign_key: true
      t.integer :quantity
      t.integer :sales
      t.integer :shipment
      t.date :lcbo_updated_on
      t.datetime :lcbo_updated_at

      t.timestamps null: false
    end
  end
end
