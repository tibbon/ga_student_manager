# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



500.times do

User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, telephone: Faker::PhoneNumber.cell_phone, street_address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip_code: Faker::Address.postcode, emergency_contact: Faker::Name.name, emergency_contact_phone: Faker::PhoneNumber.cell_phone)

end


5.times do
	
User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, is_admin: true, telephone: Faker::PhoneNumber.cell_phone, street_address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip_code: Faker::Address.postcode, emergency_contact: Faker::Name.name, emergency_contact_phone: Faker::PhoneNumber.cell_phone)
end


20.times do
	
User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, telephone: Faker::PhoneNumber.cell_phone, street_address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip_code: Faker::Address.postcode, emergency_contact: Faker::Name.name, emergency_contact_phone: Faker::PhoneNumber.cell_phone)
end


Course.create(name: "WDI", location: "Boston", session: 'Fall 2013', start_date: Date.today - 1.months, end_date: Date.today + 2.months)
