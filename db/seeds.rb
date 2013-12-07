# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "\nSeeding database..."

# users
user1 = FactoryGirl.create :user
user2 = FactoryGirl.create :user
user3 = FactoryGirl.create :user
user4 = FactoryGirl.create :user

puts User.all

# organizations
organization1 = FactoryGirl.create :organization
organization2 = FactoryGirl.create :organization

puts Organization.all

# permission_sets
permission_set1 = FactoryGirl.create :permission_set
permission_set2 = FactoryGirl.create :permission_set
permission_set3 = FactoryGirl.create :permission_set
permission_set4 = FactoryGirl.create :permission_set

puts PermissionSet.all

# memberships
membership1 = FactoryGirl.create(:membership, organization_id: organization1.id, user_id: user1.id, permission_set_id: permission_set1.id)
membership2 = FactoryGirl.create(:membership, organization_id: organization1.id, user_id: user2.id, permission_set_id: permission_set2.id)
membership3 = FactoryGirl.create(:membership, organization_id: organization1.id, user_id: user3.id, permission_set_id: permission_set3.id)
membership4 = FactoryGirl.create(:membership, organization_id: organization1.id, user_id: user4.id, permission_set_id: permission_set4.id)

puts Membership.all

# locations
location1 = FactoryGirl.create :location, organization_id: organization1.id
location2 = FactoryGirl.create :location, organization_id: organization1.id
location3 = FactoryGirl.create :location, organization_id: organization1.id

puts Location.all

# rooms
room1 = FactoryGirl.create :room, location_id: location1.id, organization_id: location1.organization.id

room2 = FactoryGirl.create :room, location_id: location2.id, organization_id: location2.organization.id
room3 = FactoryGirl.create :room, location_id: location2.id, organization_id: location2.organization.id

room4 = FactoryGirl.create :room, location_id: location3.id, organization_id: location3.organization.id
room5 = FactoryGirl.create :room, location_id: location3.id, organization_id: location3.organization.id
room6 = FactoryGirl.create :room, location_id: location3.id, organization_id: location3.organization.id

puts Room.all

# bookings
booking1 = FactoryGirl.create :booking_repeats_every_3_days, 
                              :ends_in_20_days,
                              calendar_id: room1.calendar.id,
                              booker_id: User.last.id
booking2 = FactoryGirl.create :booking_repeats_every_2_weeks_on_sun_and_thu, 
                              :ends_in_20_weeks, 
                              calendar_id: room2.calendar.id,
                              booker_id: User.last.id
booking3 = FactoryGirl.create :booking_repeats_every_2_months_on_the_1st_2nd_and_10th,
                              :ends_in_20_months, 
                              calendar_id: room3.calendar.id,
                              booker_id: User.last.id
booking4 = FactoryGirl.create :booking_repeats_every_3_months_on_first_and_last_mon_and_sat,
                              :ends_in_20_months,
                              calendar_id: room4.calendar.id,
                              booker_id: User.last.id
booking5 = FactoryGirl.create :booking_repeats_every_year_on_2nd_and_3rd_tues_and_fri_of_feb_and_nov,
                              :ends_in_20_years,
                              calendar_id: room5.calendar.id,
                              booker_id: User.last.id
booking6 = FactoryGirl.create :booking_repeats_every_2_years_on_booking_date_in_mar_and_aug,
                              :ends_in_20_years,
                              calendar_id: room6.calendar.id,
                              booker_id: User.last.id

puts Booking.all

puts "...Database seed complete!\n\n"