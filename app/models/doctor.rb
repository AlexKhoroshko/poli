class Doctor < User
  has_many :doctor_categories
  has_many :categories, through: :doctor_categories
  has_many :appointments
  has_many :patients, through: :appointments

  validate :maximum_open_appointments

  scope :by_category, lambda { |value = nil|
    if value.present?
      joins(:categories).where(categories: { name: value })
    else
      all
    end
  }

  private

  def maximum_open_appointments
    open_appointments_count = appointments.open.count
    return unless open_appointments_count >= 10

    errors.add(:base, 'Maximum number of open appointments reached')
  end
end
