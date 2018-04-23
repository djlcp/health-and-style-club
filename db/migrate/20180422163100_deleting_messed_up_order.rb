class DeletingMessedUpOrder < ActiveRecord::Migration[5.1]
  def change
   drop_table :content
  end
