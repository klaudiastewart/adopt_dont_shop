class Application < ApplicationRecord
  has_many :application_pets
  has_many :pets, through: :application_pets

  validates :name, :street_address, :city, :zip_code, presence: true
  # validates :description, presence: true
  after_initialize :default, unless: :persisted? #unless status is changed, it will remain "in progress"

  #Can update status to use t.enum in table

  def default
    self.status = "In Progress"
  end

  def pending_status
    self.status = "Pending"
  end
end
