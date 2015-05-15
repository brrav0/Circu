class AddClientcontactToUsers < ActiveRecord::Migration
  def change
    add_column :users, :clientcontact, :boolean, default: false
  end
end
