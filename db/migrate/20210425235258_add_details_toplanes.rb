class AddDetailsToplanes < ActiveRecord::Migration[6.0]
  def change

    add_column :planes, :go_time, :string
    add_column :planes, :back_time, :string

    add_column :planes, :howmany, :integer
  end
end
