class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body_text
      t.boolean :paid_for
      t.string :state

      t.timestamps
    end
  end
end
