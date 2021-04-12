class CreateCountryUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :country_users do |t|
      t.references :user, foregin_key: true
      t.references :country, foregin_key: true
      t.timestamps
    end
  end
end
