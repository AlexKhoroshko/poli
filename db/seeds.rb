require 'faker'

if AdminUser.all.none?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end

if Category.all.none?
  %w[Cardiology Dermatology Gastroenterology].each do |name|
    Category.create!(name: name)
  end
end

if Doctor.all.none?
  doctor_names = ['John Smith', 'Emily Johnson', 'Michael Davis', 'Sarah Thompson',
                  'David Rodriguez']
  doctor_names.each do |doctor_name|
    doctor = Doctor.create!(
      phone_number: Faker::PhoneNumber.unique.subscriber_number(length: 10),
      password: 'password',
      first_name: doctor_name.split(' ')[0],
      last_name: doctor_name.split(' ')[1]
    )

    categories = Category.all.sample(1)
    categories.each do |category|
      DoctorCategory.create!(doctor: doctor, category: category)
    end
  end
end
