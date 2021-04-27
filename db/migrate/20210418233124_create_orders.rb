class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
     
      t.references :user, null: false,foreign_key: true
      t.references :country, null: false,foreign_key: true
      t.references :plane
      t.references :hotel
      t.references :plane_go
      t.references :plane_back
      t.references :tour
      
      t.timestamps
    end
  end
end
