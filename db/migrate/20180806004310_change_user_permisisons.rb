class ChangeUserPermisisons < ActiveRecord::Migration[5.1]
  def change

    admins = User.where(role: 'contributor')
    admins.map {|a| a.role = 'admin'; a.save}
    contributors = User.where(role: 'subscriber')
    contributors.map {|c| c.role = 'contributor'; c.save}
    subscribers = User.where(role: 'standard')
    subscribers.map {|c| c.role = 'subscriber'; c.save}
    standard = User.where(role: nil)
    standard.map {|s| s.role = 'standard'; s.save}

    change_column :users, :role, :integer, default: 1
  end
end
