class AppointmentsController < BaseController
  def index
    @appointments = current_user.appointments.includes(:doctor)
  end

  def create
    @appointment = current_user.appointments.build(doctor_id: params[:doctor_id])

    if @appointment.save
      redirect_to root_path, notice: 'Appointment booked successfully!'
    else
      redirect_to root_path, alert: @appointment.errors.full_messages.to_sentence
    end
  end
end
