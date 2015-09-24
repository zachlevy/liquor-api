class CreateStoreClasses < ActiveRecord::Migration
  def change
    create_table :store_classes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
