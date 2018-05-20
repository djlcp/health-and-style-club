class AddForeignKey < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :masterclass_id, :integer, index: true
    add_column :documents, :masterclass_id, :integer, index: true
    add_column :events, :masterclass_id, :integer, index: true
  end
end
