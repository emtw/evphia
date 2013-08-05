class SetGuestToTrueOnGuests < ActiveRecord::Migration
  def change
    change_column :guests, :guest, :boolean, :default => true
  end
end
