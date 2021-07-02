require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #me' do
    let(:user) { create(:user) }

    context 'when user is unauthorized' do
      before do
        get :me
        @parsed_response = JSON.parse(response.body, symbolize_keys: true)
      end

      it 'return unauthorized message' do
        expect(response).to have_http_status(401)
        expect(@parsed_response['message']).to eq(I18n.t('errors.messages.not_authenticated'))
      end
    end

    context 'when user is found' do
      before do
        authenticate_user(user)
        get :me
        @parsed_response = JSON.parse(response.body, symbolize_keys: true)['user']
      end

      it 'return user data' do
        expect(response).to have_http_status(200)
        expect(@parsed_response['id']).to eq(user.id)
        expect(@parsed_response['name']).to eq(user.name)
        expect(@parsed_response['email']).to eq(user.email)
        expect(@parsed_response['phone_number']).to eq(user.phone_number)
      end
    end
  end

  describe 'POST #create' do
    let(:valid_params) do
      {
        user: {
          email: 'test@user.com',
          name: 'User teste',
          cpf: '42954534044',
          birth_date: '03/08/2000',
          phone_number: '14997007502',
          password: 'mudar@123',
          password_confirmation: 'mudar@123'
        }
      }
    end

    context 'when user is create with valid params' do
      before do
        post :create, params: valid_params
      end

      it 'returns status code created' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when email be used' do
      before do
        post :create, params: valid_params
        post :create, params: valid_params
      end

      it 'returns status code created' do
        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)['message']).to eq('Email já está em uso.')
      end
    end
  end
end
