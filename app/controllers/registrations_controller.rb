require 'google/api_client'
require 'google_drive'

class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :edit, :update, :destroy]

 #  # GET /registrations
 #  # GET /registrations.json
 #  def index

	# @registrations = Registration.all
	# # format.html {redirect_to action: 'new'}
	# # redirect_to :action =>
 #  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
  	 @pageTitle = "register"
  end

  # GET /registrations/new
  def new
	@registration = Registration.new
	@pageTitle = "register"
  end

  # POST /registrations
  # POST /registrations.json
  def create
	@registration = Registration.new(registration_params)
	RegistrationInsert.insert(registration_params)


	respond_to do |format|
	  if @registration.save
		format.html { redirect_to @registration, notice: 'Registration was successfully created.' }
		format.json { render :show, status: :created, location: @registration }
	  else
		format.html { render :new }
		format.json { render json: @registration.errors, status: :unprocessable_entity }
	  end
	end
  end

  private
	# Use callbacks to share common setup or constraints between actions.
	def set_registration
	  @registration = Registration.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def registration_params
	  params.require(:registration).permit(:firstName, :lastName, :shirtSize, :year, :email)
	end
end
