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
end
