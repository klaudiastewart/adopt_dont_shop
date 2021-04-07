class Pet < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: true
  belongs_to :shelter
  has_many :application_pets
  has_many :applications, through: :application_pets

  def shelter_name
    shelter.name
  end

  def self.adoptable
    where(adoptable: true)
  end

  def self.partial_match
    #How do I get params to come thru? to use this method on applications controller?
    where("name ILIKE ?", "%#{params[:search]}%")
  end
end
