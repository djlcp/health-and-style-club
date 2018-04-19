class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.integer :user
      t.decimal :sub_total, precision: 10, scale: 2
      t.decimal :vat,       precision: 10, scale: 2
      t.decimal :total,     precision: 10, scale: 2

      t.timestamps
    end
  end
end
