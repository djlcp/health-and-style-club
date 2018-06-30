class AddPreviewToCollection < ActiveRecord::Migration[5.1]
  def change
    add_column :collections, :preview, :string
  end
end
