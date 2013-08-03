class ChangeIndexOnKeyholders < ActiveRecord::Migration
  def change
    remove_index(:keyholders, :name => 'index_keyholders_on_email')
    add_index(:keyholders, :username, :unique => true)
  end
end
