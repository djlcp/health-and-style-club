class DropRedundantUrl < ActiveRecord::Migration[5.1]
  def change
    remove_column :content, :image_url
    remove_column :content, :video_url
    remove_column :content, :doc_url
  end
end
