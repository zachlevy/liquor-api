class AddManagerAndEmailToStore < ActiveRecord::Migration
  def change
    add_column :stores, :manager_name, :string
    add_column :stores, :manager_email, :string
  end
end
