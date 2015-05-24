class AddCommentsToBankaccounts < ActiveRecord::Migration
  def change
    add_column :bankaccounts, :comments, :string
  end
end
