class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :country_code
      t.string :postal_code
      t.integer :provider_id
      t.timestamps
    end
  end
end
