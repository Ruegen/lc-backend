class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :feature_id
      t.references :property, foreign_key: true
      t.string :full_address
      t.string :lga_code
      t.string :state
      t.string :postcode

      t.timestamps
    end
  end
end
