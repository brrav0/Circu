class ChangeSenttoIssued < ActiveRecord::Migration
  def change
    rename_column :bankaccounts, :sent, :issued
  end
end
