class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.references :product, index: true, foreign_key: true
      t.references :store, index: true, foreign_key: true
      t.date :date
      t.text :comment

      t.timestamps null: false
    end
  end
end
