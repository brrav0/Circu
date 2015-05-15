class CreateBankcontacts < ActiveRecord::Migration
  def change
    create_table :bankcontacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :bank, index: true

      t.timestamps null: false
    end
    add_foreign_key :bankcontacts, :banks
  end
end
