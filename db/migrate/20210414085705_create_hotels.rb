class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.integer :country_hotel_id, null: false
      t.integer :day, null: false
      t.integer :total_price, null: false
      t.references :user, null: false,foreign_key: true
      t.references :country, null: false,foreign_key: true
      t.timestamps
    end
  end
end
