class CreateInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :infos do |t|
      t.string :passport_number, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :nationality, null: false
      t.date :birthday, null: false
      t.string :sex, null: false
      t.string :registered_place, null: false
      t.date :issue_date, null: false
      t.date :expiry_date, null: false
      t.timestamps
    end
  end
end
