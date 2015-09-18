class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :number
      t.references :store_class, index: true, foreign_key: true
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :fax
      t.boolean :dead
      t.decimal :lat
      t.decimal :lng
      t.string :name
      t.string :phone
      t.datetime :lcbo_updated_at

      t.timestamps null: false
    end
  end
end
