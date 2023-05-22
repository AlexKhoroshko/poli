require 'rails_helper'

RSpec.describe AppointmentsController, type: :request do
  let(:user) { create(:user) }
  let(:doctor) { create(:doctor) }

  before do
    sign_in user
  end

  describe 'POST #create' do
    context 'when appointment is successfully created' do
      it 'redirects to the root path with success notice' do
        post appointments_path(doctor_id: doctor.id)

        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('Appointment booked successfully!')
      end
    end

    context 'when appointment creation fails' do
      it 'redirects to the root path with error alert' do
        post appointments_path(doctor_id: 123)

        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to be_present
      end
    end
  end
end
