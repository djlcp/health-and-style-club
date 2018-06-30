class AddDefaultToPostChargeFor < ActiveRecord::Migration[5.1]
  def change
    change_column_default :posts, :paid_for, false, nil
  end
end
