class AddnameToServerSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :serversettings, :task_name, :string, index: true
  end
end
