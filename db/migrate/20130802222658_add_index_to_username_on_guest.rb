class AddIndexToUsernameOnGuest < ActiveRecord::Migration
  def change
    add_index(:guests, :username, :unique => true)
    remove_column :guests, :email
  end
end
