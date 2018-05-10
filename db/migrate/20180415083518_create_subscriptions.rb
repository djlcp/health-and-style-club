class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.text     :chargebee_id
      t.boolean  :paid_for
      t.integer  :user_id

      t.timestamps
    end
  end
end
