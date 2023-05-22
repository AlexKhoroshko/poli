FactoryBot.define do
  factory :doctor, parent: :user, class: 'Doctor' do
    phone_number { '1234567891' }
  end
end
