class ChangeContentTypeToInteger < ActiveRecord::Migration[5.1]
  def change
    change_column :contents, :content_type, :integer

  end
end
