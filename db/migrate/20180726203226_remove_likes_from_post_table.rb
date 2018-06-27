class RemoveLikesFromPostTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :likes
  end
end
