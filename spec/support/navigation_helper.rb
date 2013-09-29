module NavigationHelper

  def fill_in_new_room_form(room_attributes)
    within(".navbar") do
      click_link('Organizations')
    end
    within('#organizations-table') do 
      page.first(:link, 'View').click
    end
    click_link 'New Room'
    within('#room-fields') do 
      fill_in ('Name'), :with => room_attributes[:name]
      select(room_attributes[:location_name], :from => 'Location')
      fill_in 'Price per hour', :with => room_attributes[:price_per_hour]
      fill_in 'People capacity', :with => room_attributes[:people_capacity]
    end
      
  end

  def edit_first_room_in_rooms_table
    visit '/'
    within(".navbar") do
      click_link('Organizations')
    end
    within('#organizations-table') do 
      page.first(:link, 'View').click
    end
    within('#rooms-table') do 
      page.first(:link, 'Edit').click
    end
  end

  def visit_show_page_of_first_organization_in_organizations_table
    within(".navbar") do
      click_link('Organizations')
    end
    within('#organizations-table') do 
      page.first(:link, 'View').click
    end
  end

end