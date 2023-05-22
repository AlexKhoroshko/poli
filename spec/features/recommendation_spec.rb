require 'rails_helper'

RSpec.describe 'Recommendations', type: :feature do
  let!(:doctor) { create(:doctor) }

  before do
    visit new_user_session_path
    fill_in 'Phone number', with: doctor.phone_number
    fill_in 'Password', with: doctor.password
    click_button 'Log in'
  end

  scenario 'Doctor leaves a recommendation for an appointment' do
    create(:appointment, doctor: doctor)

    visit doctor_path

    click_on 'Leave Recommendation'

    fill_in 'Title', with: 'Test Recommendation'
    fill_in 'Description', with: 'This is a test recommendation.'
    click_button 'Create Recommendation'

    expect(current_path).to eq(doctor_path)
    expect(page).to have_content('Recommendation created successfully.')
  end
end
