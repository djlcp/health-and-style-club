class AddSubTypesToRecipies < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :sub_category, :integer
  end
end
