class Api::V1::UserTokenController < ApplicationController
	skip_before_action :verify_authenticity_token
end
