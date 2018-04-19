class AddingUserAddressesAndNames < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :surname, :string
    add_column :users, :middle_names, :string
    add_column :users, :phone, :string
    add_column :users, :address_line_1, :string
    add_column :users, :address_line_2, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :post_code, :string
  end
end
