class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.integer :sequence
      t.string :link

      t.timestamps
    end
  end
end