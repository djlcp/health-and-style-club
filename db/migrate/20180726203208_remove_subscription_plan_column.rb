class RemoveSubscriptionPlanColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :subscriptions, :plan_name
    remove_column :subscriptions, :plan_description
    remove_column :subscriptions, :plan_price
  end
end
