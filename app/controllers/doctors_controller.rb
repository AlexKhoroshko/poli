class DoctorsController < BaseController
  def show
    @appointments = current_user.appointments.includes(:patient)
  end
end
