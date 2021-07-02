require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe '#find_by_token' do
    context 'when user is found' do
      before do
        @response = described_class.find_by_token(user.token)
      end

      it 'returns user' do
        expect(@response).to eq(user)
      end
    end
  end
end
