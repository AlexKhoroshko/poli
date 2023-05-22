class User < ApplicationRecord
  devise :database_authenticatable, :registerable, authentication_keys: [:phone_number]

  validates_presence_of :phone_number, :first_name, :last_name
  validates_uniqueness_of :phone_number
  validate :valid_phone_number_format

  private

  def valid_phone_number_format
    phone_number_regex = /\A\d{10}\z/

    unless phone_number_regex.match?(phone_number)
      errors.add(:phone_number, 'must be a valid phone number')
    end
  end
end
