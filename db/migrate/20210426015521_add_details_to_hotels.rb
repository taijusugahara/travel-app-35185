class AddDetailsToHotels < ActiveRecord::Migration[6.0]
  def change
    add_column :hotels, :howmany, :integer
  end
end
