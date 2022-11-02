require 'rails_helper'

RSpec.describe Api::V1::RankingsController, type: :request do
  let(:tag) { create(:ranking) }
  let(:id) { ranking.id }

  before do
    create_list(:ranking, 10)
  end

  describe 'GET /api/v1/rankings' do
    it 'returns correct response' do
      is_expected.to eq 200
      json = JSON.parse(response.body)
      expect(json.length).to eq Ranking.all.length
    end
  end

  describe 'POST /api/v1/rankings' do
    let(:params) { { ranking: attributes_for(:ranking) } }

    it { is_expected.to eq 201 }

    it { expect { subject }.to change(Ranking, :count).by(1) }
  end
end
