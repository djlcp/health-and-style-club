class CreateUsersCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :users_collections do |t|
      t.references :user, foreign_key: true
      t.references :collection, foreign_key: true
      t.integer :stage
      t.timestamps
    end
  end
end
