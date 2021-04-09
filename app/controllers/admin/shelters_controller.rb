class Admin::SheltersController < ApplicationController
  def index
    @shelters = Shelter.order_reverse_alpha
    @pending = Shelter.pending_applications
  end
end
