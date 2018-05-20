class ChangeContentDescriptionAndPostText < ActiveRecord::Migration[5.1]
  def change
    # change_column :contents, :description, :text
    # remove_column :contents, :order
    change_column :posts, :body_text, :text
  end
end
