class CreateBankaccounts < ActiveRecord::Migration
  def change
    create_table :bankaccounts do |t|
      t.string :number
      t.string :currency
      t.decimal :balance
      t.references :client, index: true
      t.references :bank, index: true

      t.timestamps null: false
    end
    add_foreign_key :bankaccounts, :clients
    add_foreign_key :bankaccounts, :banks
  end
end
