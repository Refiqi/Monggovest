require 'rails_helper'

RSpec.describe 'User Investor API', type: :request do
  # initialize test data
  let(:users) { create_list(:user, 1)
  let(:product_investss) { create_list(:product_invests, 1)}
  let!(:user_investors) { create_list(:user_investor, 1) }
  let(:user_investor_id) { user_investors.first.id }

  # Test suite for GET /user_investors
  describe 'GET/user_invest' do
    # make HTTP get request before each example
    before { get'/user_invest' }

    it 'returns user_invest' do
      before { get "/user_invest/#{user_investor_id}" }

      context 'when the record exist' do
        it 'returns the user_investor' do
          expect(json.not_to(be_empty))
          expect(json['id']).to eq(user_invetor_id)
        end

        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
      end
    end
  end

  describe 'GET/user_invest/:id' do
    before { get "user_invest/#{user_investor_id}" }

    context 'when the record exists' do
      it 'returns the user_investor' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(user_investor_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:user_investor) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find UserInvetor/)
      end
    end
  end

  # Test suites for POST /user_investor
  describe 'POST/user_invest' do
    # valid payload
    let(:valid_attributes) { { product_invests_id: 1, investor_slot: 1, investor_pay: 1, invest_year: 1 } }

    context 'when the request is valid' do
      before { post '/user_invest', params: valid_attributes }

      it 'creates a user_investor' do
        expect(json['product_invests_id']).to eq(1)
        expect(json['investor_slot']).to eq(1)
        expect(json['investor_pay']).to eq(1)
        expect(json['invest_year']).to eq(1)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/user_invest', params: { product_invests_id: 1, investor_slot: 1, investor_pay: 1, invest_year: 1 } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created_at can't be blank/)
      end
    end
  end

  # Test suites for PUT /user_investors/:id
  describe 'PUT /unser_invest/:id' do
    let(:valid_attributes) { { product_invests_id: 1, investor_slot: 1, investor_pay: 1, invest_year: 1 } }

    context 'when the record exists' do
      before { put "/user_invest/#{user_investor_id}" }

      it 'returns status code 204' do
        expect(response.body).to have_http_status(204)
      end
    end
  end

  # Test suites DELETE /user_investors/:id
  describe 'DELETE /user_invest/:id' do
    before { delete "/user_invest/#{user_investors}"}

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
  }
end