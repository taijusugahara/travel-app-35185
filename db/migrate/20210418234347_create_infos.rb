class CreateInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :infos do |t|
      t.string :passport_number, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
     
      t.references :order, null: false,foreign_key: true
      t.timestamps
    end
  end
end
