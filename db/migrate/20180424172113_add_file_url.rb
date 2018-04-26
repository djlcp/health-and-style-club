class AddFileUrl < ActiveRecord::Migration[5.1]
  def change
    add_column :content, :file_url, :string
  end
end
