class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :number
      t.string :name
      t.string :address
      t.string :city
      t.string :province
      t.string :postal_code
      t.string :phone
      t.string :fax
      t.boolean :dead
      t.decimal :lat
      t.decimal :lng
      t.references :store_class, index: true, foreign_key: true
      t.datetime :lcbo_updated_at
      t.timestamps null: false
    end
  end
end
