class ChangeRoleDataType < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :role, :old_role
    add_column :users, :role, :integer
    User.all do |user|
      role_num =
        case user.old_role
        when 'contributor'
          2
        when 'subscriber'
          1
        else
          3
        end
      user.update(role: role_num)
    end
    remove_column :users, :old_role
  end
end
