class AddAdminBoolean < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean, false 
  end
end
