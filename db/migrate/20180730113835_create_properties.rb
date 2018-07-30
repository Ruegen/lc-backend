class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.references :local_government_area, foreign_key: true
      t.string :lga_code
      t.string :council_property_number
      t.decimal :longitude
      t.decimal :latitude

      t.timestamps
    end
  end
end
