class ChangeExpiryDateColumnToDateTime < ActiveRecord::Migration[5.1]
  def change
<<<<<<< HEAD
    change_column :subscriptions, :expiry_date, :datetime
    #add_column :subscriptions, :paid_for, :boolean, default: false
=======
    # change_column :subscriptions, :expiry_date, :datetime
    # add_column :subscriptions, :paid_for, :boolean, default: false
>>>>>>> develop
  end
end
