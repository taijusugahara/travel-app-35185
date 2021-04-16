class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :day, null: false
      t.date :go_date, null: false
      t.date :back_date, null: false
      t.references :user, null: false,foreign_key: true
      t.references :country, null: false,foreign_key: true
      t.timestamps
    end
  end
end
