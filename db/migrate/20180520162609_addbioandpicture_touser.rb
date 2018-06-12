class AddbioandpictureTouser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bio, :string
    add_column :users, :bioavatar, :string
  end
end
