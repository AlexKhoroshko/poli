FactoryBot.define do
  factory :appointment do
    association :doctor
    association :patient
    status { :open }
  end
end
