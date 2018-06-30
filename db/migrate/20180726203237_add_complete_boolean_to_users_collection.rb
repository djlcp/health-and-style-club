class AddCompleteBooleanToUsersCollection < ActiveRecord::Migration[5.1]
  def change
    add_column :users_collections, :complete, :boolean, default: false
  end
end
