class CreatePostContents < ActiveRecord::Migration[5.1]
  def change
    create_table :post_contents do |t|
      t.integer :post_id
      t.integer :content_id
      t.integer :order

      t.timestamps
    end
  end
end
