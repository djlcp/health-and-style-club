class ChangeUser2IdOnPostsTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :user2_id, :user_id
  end
end
