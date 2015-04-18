class CreateSignatories < ActiveRecord::Migration
  def change
    create_table :signatories do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :bank, index: true

      t.timestamps null: false
    end
    add_foreign_key :signatories, :banks
    add_index :signatories, [:bank_id, :created_at]
  end
end
