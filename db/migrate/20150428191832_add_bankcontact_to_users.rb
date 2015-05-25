class AddBankcontactToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bankcontact, :boolean, default: false
  end
end
