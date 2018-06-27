class AddWelcomeVideoBooleanToVideo < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :welcome_video, :boolean, default: false
  end
end
