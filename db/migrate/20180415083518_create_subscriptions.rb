class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.string   :plan_name
      t.text     :plan_description
      t.decimal  :plan_price, :precision => 4, :scale => 2
      t.date     :expiry_date
      t.integer  :user_id

      t.timestamps null: false
    end
  end
end
