require 'rails_helper'

RSpec.describe ApplicationRecord, type: :model do
  describe '#set_current' do
    context 'when current user is defined' do
      let(:user) { create(:user) }

      before do
        @response = described_class.set_current(user)
      end

      it 'returns user' do
        expect(@response).to eq(user)
      end
    end
  end
end
