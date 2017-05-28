class VolunteersController < ApplicationController

  def index
    @volunteers = Volunteer.all
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)

    respond_to do |format|
      if @volunteer.save
        format.html { redirect_to root_path, notice: 'Volunteer was successfully created.' }
      else
        format.html { redirect_to root_path }
      end
    end
  end

  private


  def volunteer_params
    params.permit(:firstname, :lastname, :email, :phone_number, :age, :gender)
  end

end
