require 'rails_helper'

RSpec.describe "the Application show page" do
  before(:each) do
    @applicant = Application.find_or_create_by!(name: "Fred",
                              street_address: "123 way",
                              city: "Denver",
                              state: "Colorado",
                              zip_code: 80204,
                              status: "In Progress",
                              created_at: Time.now,
                              updated_at: Time.now
                              )
  @pound = Shelter.find_or_create_by!(foster_program: true,
                                    name: "da pound",
                                    city: "Denver",
                                    rank: 1,
                                    created_at: Time.now,
                                    updated_at: Time.now
                                    )
  @dog = @pound.pets.find_or_create_by!(name: "Bob",
                                      adoptable: true,
                                      age: 1,
                                      breed: "smol",
                                      created_at: Time.now,
                                      updated_at: Time.now
                                      )

    end

    it "should display applicant info" do
    visit "/applications/#{@applicant.id}"

    expect(page).to have_content(@applicant.name)
    expect(page).to have_content(@applicant.street_address)
    expect(page).to have_content(@applicant.city)
    expect(page).to have_content(@applicant.state)
    expect(page).to have_content(@applicant.zip_code)
  end

  it "shows links that can be clicked on" do
    visit "/applications/#{@applicant.id}"

    click_link "Pets"
    click_link "Shelters"
    click_link "Veterinarians"
    click_link "Veterinary Offices"
  end

  it 'gives message to add pet before submittal description box and status in progress' do
    visit "/applications/#{@applicant.id}"

    expect(page).to have_content("Please add an animal to your application to submit")
    expect(page).to have_content(@applicant.default)
  end

  it 'can search for pets to add and can add them' do
    visit "/applications/#{@applicant.id}"

    expect(page).to have_content("Add a pet to this application by name:")

    fill_in "search", with: "bob"
    click_button "Submit"

    expect(current_path).to eq("/applications/#{@applicant.id}")
    expect(page).to have_content("Bob")
    expect(page).to have_button("Adopt this pet")

    click_button "Adopt this pet"

    expect(current_path).to eq("/applications/#{@applicant.id}")
    expect(page).to have_content("Bob") #How to do a within for this?
    expect(page).to have_content("Please describe below why you'd make a good home for this pet:")
  end

  it 'can submit an application' do
    visit "/applications/#{@applicant.id}"

    fill_in "search", with: "bob"
    click_button "Submit"
    click_button "Adopt this pet"

    fill_in "description", with: "I like doges"
    click_button "Submit Application"

    expect(current_path).to eq("/applications/#{@applicant.id}")
    expect(page).to have_content("You've already submitted your application")
    expect(page).to have_content(@applicant.pending_status)
  end
end
