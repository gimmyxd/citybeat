class VolunteersController < ApplicationController

  def index
    @volunteers = Volunteers.all
  end

  def create
    @volunteer = Volunteers.new(volunteer_params)

    respond_to do |format|
      if @volunteer.save
        format.html { redirect_to @volunteer, notice: 'Volunteer was successfully created.' }
        format.json { render :show, status: :created, location: @volunteer }
      else
        format.html { render :new }
        format.json { render json: @volunteer.errors, status: :unprocessable_entity }
      end
    end

  end

  private


  def volunteer_params
    params.permit(:firstname, :lastname, :email, :phone_number, :age, :cnp, :gender)
  end

end