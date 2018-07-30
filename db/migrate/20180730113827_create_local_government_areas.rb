class CreateLocalGovernmentAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :local_government_areas do |t|
      t.string :code
      t.string :name
      t.string :long_name

      t.timestamps
    end
  end
end
