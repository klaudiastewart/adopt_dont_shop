class ApplicationPet < ApplicationRecord
  belongs_to :application
  belongs_to :pet

  enum status: [:approved, :rejected, :stand_by]
  #ApplicationPet.last.update(status: 0)
end
