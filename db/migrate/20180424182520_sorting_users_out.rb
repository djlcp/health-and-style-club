class SortingUsersOut < ActiveRecord::Migration[5.1]
  def change
   remove_column :posts, :user2_id
  end
end
