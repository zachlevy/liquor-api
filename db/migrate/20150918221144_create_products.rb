class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :number
      t.string :name
      t.integer :case_size

      t.timestamps null: false
    end
  end
end
