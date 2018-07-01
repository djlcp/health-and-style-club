class MakeVideosPolymorphic < ActiveRecord::Migration[5.1]
  def change
    rename_column :videos, :masterclass_id, :videoable_id
    add_column :videos, :videoable_type, :string, index: true
    rename_column :videos, :sequence, :position
  end
end
