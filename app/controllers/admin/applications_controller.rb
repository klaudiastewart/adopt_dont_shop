class Admin::ApplicationsController < ApplicationController
  def show
    @applicant = Application.find(params[:id])
    @pets = Application.find(params[:id]).pets
  end

  def update
    @pets = Application.find(params[:id]).pets
    @applicant = Application.find(params[:id])
    @joins = ApplicationPet.where("application_id = ?", params[:id])
    @application_pets = @joins.update(
      status: 0
    )

    render :show
  end
end
