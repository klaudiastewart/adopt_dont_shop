require 'rails_helper'

RSpec.describe 'the admins shelters index page' do
  it 'lists all the shelters in system in reverse alphabetical order' do
    pound = Shelter.create!(foster_program: true,
                            name: "a pound",
                            city: "Denver",
                            rank: 1
                            )
    happy_place = Shelter.create!(foster_program: true,
                                  name: "ppple jack",
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

    expect(Shelter.order_reverse_alpha.first).to eq(happy_place)
    expect(Shelter.order_reverse_alpha.last).to eq(pound)
  end

  it 'has a section for shelters with pending applications' do
    pound = Shelter.create!(foster_program: true,
                            name: "a pound",
                            city: "Denver",
                            rank: 1
                            )

    visit 'admin/shelters'

    expect(page).to have_content("Shelters with Pending Applications")
  end 
end
