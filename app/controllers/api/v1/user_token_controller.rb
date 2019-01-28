# frozen_string_literal: true

# This controller is for generating JWT Token via Gem Knock

class Api::V1::UserTokenController < Knock::AuthTokenController
  skip_before_action :verify_authenticity_token
end
