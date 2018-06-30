class CreateCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :collections do |t|
      t.integer :collection_type
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
