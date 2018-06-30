class RemoveCollectionsPosts < ActiveRecord::Migration[5.1]
  def change
    drop_table :collections_posts
  end
end
