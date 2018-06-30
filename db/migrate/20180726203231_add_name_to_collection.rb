class AddNameToCollection < ActiveRecord::Migration[5.1]
  def change
    add_column :collections, :name, :string
  end
end
