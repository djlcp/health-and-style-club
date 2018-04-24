class AddContentTableAgain < ActiveRecord::Migration[5.1]
    def change
      create_table :content do |t|
        t.string :content_type
        t.string :description
        t.string :image_url
        t.string :video_url
        t.string :doc_url
        t.integer :order


        t.timestamps

    end
  end
  end
