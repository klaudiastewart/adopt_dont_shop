require 'rails_helper'

RSpec.describe 'the admins shelters index page' do
  it 'lists all the shelters in system' do
    pound = Shelter.create!(foster_program: true,
                            name: "da pound",
                            city: "Denver",
                            rank: 1
                            )
    happy_place = Shelter.create!(foster_program: true,
                                  name: "appple jack",
                                  city: "Denver",
                                  rank: 1
                                  )

    visit 'admin/shelters'

    within("#shelter-name-#{pound.id}") do
      expect(page).to have_content(pound.name)
    end

    within("#shelter-name-#{happy_place.id}") do
      expect(page).to have_content(happy_place.name)
    end
  end

  it ' ' do
    @applicant = Application.find_or_create_by!(name: "Fred",
                              street_address: "123 way",
                              city: "Denver",
                              state: "Colorado",
                              zip_code: 80204,
                              status: "In Progress"
                              )

    visit "/applications/#{@applicant.id}"

    fill_in "search", with: "bob"
    click_button "Submit"
    click_button "Adopt this pet"

    fill_in "description", with: "I like doges"
    click_button "Submit Application"

    expect(current_path).to eq("/applications/#{@applicant.id}")
    expect(page).to have_content("You've already submitted your application")
    expect(page).to have_content("Pending")

  end
end
