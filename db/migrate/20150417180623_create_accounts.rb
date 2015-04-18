class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :number
      t.string :currency
      t.decimal :balance
      t.references :client, index: true
      t.references :signatory, index: true

      t.timestamps null: false
    end
    add_foreign_key :accounts, :clients
    add_foreign_key :accounts, :signatories
  end
end
