class CreatePlanes < ActiveRecord::Migration[6.0]
  def change
    create_table :planes do |t|
      t.integer :country_plane_id, null: false 
      # ↑active_hash(thai_plane,cambo_plane,vet_planeそれぞれのid)
      t.date :go_date, null: false
      t.date :back_date, null: false
      t.references :user, null: false,foreign_key: true
      t.references :country, null: false,foreign_key: true
      
      t.timestamps
    end
  end
end
