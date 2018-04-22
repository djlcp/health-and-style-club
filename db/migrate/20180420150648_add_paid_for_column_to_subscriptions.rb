class AddPaidForColumnToSubscriptions < ActiveRecord::Migration[5.1]
  def change
    add_column :subscriptions, :paid_for, :boolean
    drop_table :invoices
  end
end
