class AddUserToPosts < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :user_id, :index
  end
end
