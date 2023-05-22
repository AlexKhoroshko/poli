class Recommendation < ApplicationRecord
  belongs_to :appointment

  after_create :close_appointment

  private

  def close_appointment
    appointment.update(status: :closed)
  end
end
