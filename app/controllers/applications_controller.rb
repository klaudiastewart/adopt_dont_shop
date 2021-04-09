class ApplicationsController < ApplicationController
  def index
  end

  def show
    if params[:search]
      @applicant = Application.find(params[:id])
      @pets = Pet.partial_match(params[:search])
    else
      @applicant = Application.find(params[:id])
    end
    @applicant = Application.find(params[:id])
    @applicants_pets = @applicant.pets
  end

  def new
    @application = Application.new
  end

  def create
    application = Application.new(application_params)
    if application.save
      redirect_to "/applications/#{application.id}"
    else
      # redirect_to "/applications/new" #try render
      render :new
      flash[:alert] = "Error: #{error_message(application.errors)}"
    end
  end

  def update
    @applicant = Application.find(params[:id])
    @applicant.update({
      description: params[:description],
      status: "Pending"
      })
    redirect_to "/applications/#{@applicant.id}"
  end

  private

  def application_params
    params.permit(:name, :street_address, :city, :state, :zip_code, :description)
  end
end
