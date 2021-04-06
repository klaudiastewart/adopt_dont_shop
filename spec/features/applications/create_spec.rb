require 'rails_helper'

RSpec.describe 'application creation' do
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
  end

  describe 'the application new' do
    it 'renders the new form' do
      visit "/applications/new"

      expect(page).to have_content('New Application')
      expect(find('form')).to have_content('Name')
      expect(find('form')).to have_content('Street address')
      expect(find('form')).to have_content('City')
      expect(find('form')).to have_content('State')
      expect(find('form')).to have_content('Zip code')
    end

    describe 'the application create' do
      context 'given valid data' do
        it 'creates the application and redirects to the application show page' do
          visit "/applications/new"

          fill_in 'Name', with: '#{@applicant.name}'
          fill_in 'Street address', with: '#{@applicant.street_address}'
          fill_in 'City', with: '#{@applicant.city}'
          fill_in 'State', with: '#{@applicant.state}'
          fill_in 'Zip code', with: '#{@applicant.zip_code}'
          click_button 'Save'

          # expect(page).to have_current_path("/applications/#{@applicant.id}")
          expect(page).to have_content('#{@applicant.name}')
        end
      end

      context 'given invalid data' do
        it 're-renders the new form' do
          visit "/applications/new"

          click_button 'Save'
          expect(page).to have_current_path("/applications/new")
          expect(page).to have_content("Error: Name can't be blank, Address can't be blank, Description can't be blank")
        end
      end
    end
  end
end
