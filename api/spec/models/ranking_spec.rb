require 'rails_helper'

RSpec.describe Ranking, type: :model do
  describe 'validation' do
    describe 'all attributes are valid' do
      let(:ranking) { create(:ranking) }

      it 'is valid' do
        expect(ranking.valid?).to be true
      end
    end

    describe 'user_name is not presence' do
      let(:ranking) { build(:ranking, user_name: nil) }

      it { expect(ranking.invalid?).to be true }
    end
  end
end
