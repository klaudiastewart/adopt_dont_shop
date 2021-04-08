class AdminsController < ApplicationController
  def index
    @shelters = Shelter.order_reverse_alpha
  end
end
