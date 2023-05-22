class RecommendationsController < BaseController
  before_action :set_appointment, only: %i[new create]

  def show
    @recommendation = Recommendation.find(params[:id])
  end

  def new
    @recommendation = Recommendation.new
  end

  def create
    @recommendation = @appointment.build_recommendation(recommendation_params)
    if @recommendation.save
      redirect_to doctor_path, notice: 'Recommendation created successfully.'
    else
      render :new
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:appointment_id] || recommendation_params[:appointment_id])
  end

  def recommendation_params
    params.require(:recommendation).permit(:title, :description, :appointment_id)
  end
end
