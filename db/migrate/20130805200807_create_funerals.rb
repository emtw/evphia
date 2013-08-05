class CreateFunerals < ActiveRecord::Migration
  def change
    create_table :funerals do |t|
      t.string :funeral_pref
      t.text :casket_pref
      t.string :other_pref
      t.string :service_location
      t.string :burial_location
      t.string :ashes_location
      t.text :songs_pref
      t.text :readings
      t.text :speakers
      t.text :final_words
      t.string :dress_code
      t.string :flowers
      t.string :donations_to
      t.text :wake
      t.text :epitaph
      t.text :additional_reqs
      t.integer :user_id

      t.timestamps
    end
  end
end
