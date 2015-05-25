class AddStatusToBankaccounts < ActiveRecord::Migration
  def change
    add_column :bankaccounts, :shared, :datetime
    add_column :bankaccounts, :signed, :datetime
    add_column :bankaccounts, :sent, :datetime
    add_column :bankaccounts, :answered, :datetime
  end
end
