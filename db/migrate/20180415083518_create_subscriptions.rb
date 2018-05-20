class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.date     :expiry_date

      t.integer  :user_id

      t.timestamps null: false
    end
  end
end
