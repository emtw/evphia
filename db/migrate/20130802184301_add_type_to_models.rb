class AddTypeToModels < ActiveRecord::Migration
  def change
    add_column :users, :user, :boolean, :default => true
    add_column :keyholders, :keyholder, :boolean, :default => true
  end
end
