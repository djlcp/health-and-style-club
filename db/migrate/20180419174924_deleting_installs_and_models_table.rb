class DeletingInstallsAndModelsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :installs
    drop_table :models
  end
end
