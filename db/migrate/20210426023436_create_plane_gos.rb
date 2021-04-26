class CreatePlaneGos < ActiveRecord::Migration[6.0]
  def change
    create_table :plane_gos do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :howmany, null: false
      t.date :go_date, null: false
      t.string :go_time, null: false
      t.references :user, null: false,foreign_key: true
      t.references :country, null: false,foreign_key: true

      t.timestamps
    end
  end
end
