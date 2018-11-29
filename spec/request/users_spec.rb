require 'rails_helper'

RSpec.describe 'Create user', type: :request do
  let(:user_params)  { { "user": { email: 'refiqi@example.com', password: 'password', name: 'refiqi', role: 'admin' } } }
  let(:auth_params)  { { "auth": { email: 'refiqi@example.com', password: 'password' } } }

  describe 'POST/users/' do
    context 'When Request is valid' do
      before { post '/api/v1/users/create', params: user_params }

      it 'Result to be success' do
        expect(json['status']).to eq('OK')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'When Request is invalid' do
      before { post '/api/v1/users/create', params: { "user": { password: 'asd' } } }

      it 'Returns status 422' do
        expect(response).to have_http_status(422)
      end

      it 'Return A Validation error' do
        expect(json['result'])
          .to eq('Unfilled params')
      end
    end

    # context 'Generating JWT Token' do
    #   let!(:users) { create(:user) }
    #   let(:user_id) { users.first.id }
    #   before { post '/api/v1/user_token', params: auth_params }

    #   it 'return JWT Token' do
    #     expected_result = "jwt"
    #     expect(json["jwt"]).to eq(expected_result)
    #   end
    # end
  end

  describe 'GET /users/current' do
    URL = '/api/v1/users/current'.freeze
    AUTH_URL = '/api/v1/user_token'.freeze

    context 'when the request with NO authentication header' do
      it 'should return unauth for retrieve current user info before login' do
        get URL
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when the request contains an authentication header' do
      it 'should return the user detail' do
        user = create(:user)

        get URL, headers: authenticated_header(user)
      end
    end
  end

  describe 'GET /users' do
    URLGET = '/api/v1/users'.freeze

    it 'return Logged-in users if have authorization' do
      user = create(:user)
      get URLGET, headers: authenticated_header(user)
      expect(json['msg']).to eq("Logged-in as #{user.name}")
    end

    it 'returns Unauthorized users' do
      user = create(:user)
      get URLGET
      expect(response).to have_http_status(401)
    end
  end

  describe 'PATCH /user:id' do
    let(:patch_params) { { "user": { password: 'Baruganti' } } }

    context 'when the user exist' do
      it 'Update user detail' do
        user = create(:user)
        patch "/api/v1/user/#{user.id}", params: patch_params,
                                         headers: authenticated_header(user)
        expect(json['msg']).to eq('User details have been updated.')
      end

      it 'returns status code 202' do
        user = create(:user)
        patch "/api/v1/user/#{user.id}", params: patch_params,
                                         headers: authenticated_header(user)
        expect(response).to have_http_status(202)
      end
    end

    context "When the user doesn't exist" do
      it 'Returns Message error' do
        user = create(:user)
        patch "/api/v1/user/#{user.id}", params: { "user": { password: '1235' } },
                                         headers: authenticated_header(user)
        expect(json['message']).to eq('Please Fill the Correct params')
      end
    end
  end

  describe 'DELETE /user/:id' do
    context 'When user is admin' do
      it 'delete the id' do
        user = create(:user)
        delete "/api/v1/user/#{user.id}", params: user_params,
                                          headers: authenticated_header(user)
        expect(json['msg']).to eq('User has been deleted.')
      end
    end

    context 'When user is not admin' do
      it 'Return Unauthorized' do
        user = create(:user, role: 'user')
        delete "/api/v1/user/#{user.id}", params: user_params,
                                          headers: authenticated_header(user)
        expect(json['message']).to eq('Unauthorized Access')
      end
    end
  end
end
