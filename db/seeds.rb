# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.find_or_create_by_email :name => 'first person', :email => 'user1@example.com', :password => 'password', :password_confirmation => 'password'
puts 'user: ' << user1.name

user2 = User.find_or_create_by_email :name => 'second person', :email => 'user2@example.com', :password => 'password', :password_confirmation => 'password'
puts 'user: ' << user2.name

user3 = User.find_or_create_by_email :name => 'third person', :email => 'user3@example.com', :password => 'password', :password_confirmation => 'password'
puts 'user: ' << user3.name

permission_set1 = PermissionSet.where(create__organizations: false, create__memberships: false).first_or_create
puts 'permission_set created '

organization1 = Organization.where(name: "TechHub").first_or_create
puts 'organization: ' << organization1.name

membership1 = Membership.where(user_id: user1.id, organization_id: organization1.id, permission_set_id: permission_set1.id).first_or_create
puts 'membership: 1'

membership2 = Membership.where(user_id: user2.id, organization_id: organization1.id, permission_set_id: permission_set1.id).first_or_create
puts 'membership: 2'

membership3 = Membership.where(user_id: user3.id, organization_id: organization1.id, permission_set_id: permission_set1.id).first_or_create
puts 'membership: 3'

location1 = Location.where(name: "Site 1", address_line_1: "27 Example Road", address_line_2: "Example Area", town_city: "Example Town", county: "Example County", postcode: "EXA MPLE", country: "United Kingdom", organization_id: organization1.id).first_or_create
puts 'location1 ' << location1.name

location2 = Location.where(name: "Site 1", address_line_1: "89 New Street", address_line_2: "New Area", town_city: "New Town", county: "New County", postcode: "NEW POST", country: "United Kingdom", organization_id: organization1.id).first_or_create
puts 'location2: ' << location2.name

room1 = Room.where(name: "Room 1", price_per_hour: "9.99", location_id: location1.id, organization_id: organization1.id, people_capacity: 1).first_or_create
puts 'room: ' << room1.name

room2 = Room.where(name: "Room 2.01", price_per_hour: "60.00", location_id: location2.id, organization_id: organization1.id, people_capacity: 1).first_or_create
puts 'room: ' << room2.name

calendar1 = Calendar.where(color: "red", room_id: room1.id).first_or_create
puts 'calendar for room1'

calendar2 = Calendar.where(color: "green", room_id: room2.id).first_or_create
puts 'calendar for room2'

booking1 = Booking.where(name: "Booking1", description: "Booking 1 description", is_all_day: false, from_date: "2013-11-29", from_time: "2013-11-29 11:17:07", to_date: "2013-11-30", to_time: "2013-11-30 11:17:07", repeats: "never", time_zone: "London", calendar_id: calendar1.id, booker_id: user1.id).first_or_create
puts 'booking: ' << booking1.name

booking2 = Booking.where(name: "Booking2", description: "Booking 2 description", is_all_day: false, from_date: "2013-11-29", from_time: "2013-11-29 11:17:07", to_date: "2013-11-30", to_time: "2013-11-30 11:17:07", repeats: "never", time_zone: "London", calendar_id: calendar2.id, booker_id: user2.id).first_or_create
puts 'booking: ' << booking2.name
