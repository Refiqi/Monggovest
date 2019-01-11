require 'rails_helper'

RSpec.describe 'User Investor', type: :request do
  let!(:user) { create(:user) }
  let!(:user_investors) { create(:user_investor, user_id: user.id) }
  let(:user_id) { user.id }
  let(:id) { user_investors.first.id }

  describe 'GET /user_investor' do
    before { get '/userinvest' }

    it 'returns user_investors' do
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /user_investor/:id' do
    before { get "/userinvest/#{user_investor_id}" }

    context 'when the record exists' do
      it 'returns the user investor' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(todo_id)
      end
    end

    context 'when record does not exists' do
      let(:user_investor_id) { 100 }

      it