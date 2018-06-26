class ServerSettings < ActiveRecord::Migration[5.1]
    def change
      create_table :serversettings do |t|
        t.boolean :active, index: true
        t.integer :reactivation_date
    end
  end
end
