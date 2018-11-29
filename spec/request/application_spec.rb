# require 'rails_helper'

#   RSpec.describe 'Authorize', type: :request do
#     let!(:users) { create_list(:user, 10) }
#     let(:user_id) { users.first.id }

#     describe 'ApplicationController' do
#       before { delete '/api/v1/user/:id' }

#       context 'as Admin' do

#         it 'Return authorized' do
#           get URL, headers: authenticated_header(user)
#           expect(response).to have_http_status(200)
#         end

#         it 'Return unauthorized' do
#           delete
#           expect(json["error"]).to eq('Unauthorized')
#         end
#       end
#     end

#   end
