class CreateClientcontacts < ActiveRecord::Migration
  def change
    create_table :clientcontacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :client, index: true

      t.timestamps null: false
    end
    add_foreign_key :clientcontacts, :clients
  end
end
