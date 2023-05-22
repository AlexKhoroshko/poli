FactoryBot.define do
  factory :user do
    phone_number { '1234567890' }
    password { 'password' }
    first_name { 'John' }
    last_name { 'Doe' }
  end
end
