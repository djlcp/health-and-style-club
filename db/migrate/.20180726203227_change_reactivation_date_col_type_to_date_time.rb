class ChangeReactivationDateColTypeToDateTime < ActiveRecord::Migration[5.1]
  def change
    change_column :serversettings, :reactivation_date, :date
  end
end
