class AddChargebee < ActiveRecord::Migration[5.1]
  def change
    add_column :subscriptions, :chargebee_id, :string
  end
end
