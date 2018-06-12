class AddBackgroundImagesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :biobackground, :string
  end
end
