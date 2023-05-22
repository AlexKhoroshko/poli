require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:phone_number) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_uniqueness_of(:phone_number) }

    it 'should validate the phone number format' do
      user = create(:user)
      expect(user).to be_valid

      user.phone_number = '123'
      expect(user).not_to be_valid
      expect(user.errors[:phone_number]).to include('must be a valid phone number')
    end
  end
end
