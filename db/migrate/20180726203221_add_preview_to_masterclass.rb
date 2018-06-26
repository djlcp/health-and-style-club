class AddPreviewToMasterclass < ActiveRecord::Migration[5.1]
  def change
    add_column :masterclasses, :preview, :string
  end
end
