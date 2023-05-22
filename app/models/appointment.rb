class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  has_one :recommendation, dependent: :destroy

  enum status: %i[open closed]

  validate :unique_open_appointment

  private

  def unique_open_appointment
    existing_open_appointment = Appointment.find_by(doctor: doctor, patient: patient, status: :open)
    return unless existing_open_appointment.present? && (new_record? || existing_open_appointment != self)

    errors.add(:base, 'You already have an open appointment with this doctor')
  end
end
