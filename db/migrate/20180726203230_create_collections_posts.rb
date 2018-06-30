class CreateCollectionsPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :collections_posts do |t|
      t.integer :position
      t.references :collection, foreign_key: true
      t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
