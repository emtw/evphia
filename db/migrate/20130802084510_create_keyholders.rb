class CreateKeyholders < ActiveRecord::Migration
  def change
    create_table :keyholders do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.integer :user_id
      t.string :house
      t.string :postcode

      t.timestamps
    end
  end
end
