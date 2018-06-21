class DroppingAddressCollumnsFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users,:middle_names
    remove_column :users,:address_line_1
    remove_column :users,:address_line_2
    remove_column :users,:city
    remove_column :users,:state
    remove_column :users,:post_code
  end
end
