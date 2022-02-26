class CreateProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :providers do |t|
      t.integer :npi
      t.string :first_name
      t.string :last_name
      t.string :prefix
      t.string :credential
      t.string :gender
      t.string :status
      t.string :last_updated
      t.timestamps
    end
  end
end
