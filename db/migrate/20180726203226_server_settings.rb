class ServerSettings < ActiveRecord::Migration[5.1]
    def change
      create_table :serversettings do |t|
        t.boolean :active, index: true
         t.integer :reactivation_date
    end
    add_column :serversettings, :task_name, :string, index: true
  end
end
