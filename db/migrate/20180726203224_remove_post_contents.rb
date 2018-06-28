class RemovePostContents < ActiveRecord::Migration[5.1]
  def change
    drop_table 'post_contents'
    drop_table 'contents'
  end
end
