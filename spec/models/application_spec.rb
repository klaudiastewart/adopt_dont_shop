require 'rails_helper'

RSpec.describe Application, type: :model do
  describe 'relationships' do
    it { should have_many :application_pets }
    it { should have_many(:pets).through(:application_pets) }
  end

  describe 'instance-methods' do
    describe 'default status' do
      it 'returns the status of in progress by default' do
        applicant = Application.find_or_create_by!(name: "Fred",
                                  street_address: "123 way",
                                  city: "Denver",
                                  state: "Colorado",
                                  zip_code: 80204,
                                  status: "In Progress"
                                  )

        expect(applicant.default).to eq("In Progress")
      end
    end

    describe 'updated status after application submittal' do
      it 'changes the application stauts to pending' do
        applicant = Application.find_or_create_by!(name: "Fred",
                                  street_address: "123 way",
                                  city: "Denver",
                                  state: "Colorado",
                                  zip_code: 80204,
                                  status: "In Progress"
                                  )

        expect(applicant.pending_status).to eq("Pending")
      end
    end
  end
end
