class PatientsController < BaseController
  def show
    @doctors = Doctor.by_category(params[:category])
  end
end
