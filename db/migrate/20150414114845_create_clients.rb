class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :number_and_street
      t.string :zip_code
      t.string :city
      t.references :user, index: true

      t.timestamps null: false
    end
    #row below added automatically when creating the model by the command rails generate model ... user:references
    add_foreign_key :clients, :users
    #row below to order the clients by order of creation from most to less recent
    add_index :clients, [:user_id, :created_at]
  end
end
