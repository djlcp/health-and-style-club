class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :title
      t.integer :sequence
      t.string :link

      t.timestamps
    end
  end
end
