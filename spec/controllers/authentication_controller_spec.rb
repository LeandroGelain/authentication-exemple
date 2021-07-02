require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  let!(:user) { create(:user) }

  describe '#authenticate' do
    context 'when user is authenticated' do
      let!(:params) { { email: user.email } }

      before do
        described_class.any_instance.stub(:current_user).and_return(user)
        token = JsonWebToken.encode(user_id: user.id, user_token: user.token, key: User::TOKEN_KEY)

        allow_any_instance_of(described_class).to receive(:find_user_and_authorize!).and_return(true)
        allow_any_instance_of(described_class).to receive(:set_current).and_return(true)
        allow_any_instance_of(described_class).to receive(:authentication_token).and_return(token)

        post :authenticate
      end

      it 'returns object with token and user' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when user is not authenticated' do
      before do
        post :authenticate
      end

      it 'return unauthorized message' do
        expect(response).to have_http_status(401)
      end
    end
  end

  describe '#authentication_token' do
    before do
      @response = described_class.new.authentication_token(user)
    end

    it 'return token' do
      expect(@response).to eq(JsonWebToken.encode(user_id: user.id, user_token: user.token, key: User::TOKEN_KEY))
    end
  end
end
