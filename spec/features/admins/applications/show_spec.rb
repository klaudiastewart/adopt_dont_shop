require 'rails_helper'

RSpec.describe 'the admins applications show page' do
  it 'shows a button to approve a pet for every pet the application is for' do
    applicant = Application.create!(name: "Klaw",
                                    street_address: "123 way",
                                    city: "Denver",
                                    state: "Colorado",
                                    zip_code: 80204,
                                    description: "I like dogs",
                                    status: "Pending"
                                    )

    pound = Shelter.create!(foster_program: true,
                            name: "da pound",
                            city: "Denver",
                            rank: 1,
                            created_at: Time.now,
                            updated_at: Time.now
                            )

    dawg = pound.pets.create!(name: "bobby",
                              adoptable: true,
                              age: 1,
                              breed: "smol"
                              )

    visit "/admin/applications/#{applicant.id}"

    within("#pet-on-application-#{dawg.id}") do
      expect(page).to have_button("Approve")
    end
  end
end
