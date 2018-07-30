# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# generators
# rails g model Property lga:references lga_code council_property_number longitude:decimal latitude:decimal
# rails g model LocalGovernmentArea code name long_name
# rails g model Address feature_id:integer property:references full_address lga_code state postcode
require 'csv'
# can be done as rake task
path = Rails.root.join('db', 'sample_data')

LocalGovernmentArea.delete_all
Property.delete_all
Address.delete_all

CSV.foreach(path + 'lgas.csv', headers: true) do |row|
    LocalGovernmentArea.create!(row.to_hash)
end

CSV.foreach(path + 'properties.csv', headers: true) do |row|
    property = row.to_hash
    Property.create!(property)
end

Property.all.each do |property|
    council = LocalGovernmentArea.where(code: property.lga_code).first
    property.update_attributes(local_government_area_id: council.id)
end

CSV.foreach(path + 'addresses.csv', headers: true) do |row|
    Address.create!(row.to_hash)
end