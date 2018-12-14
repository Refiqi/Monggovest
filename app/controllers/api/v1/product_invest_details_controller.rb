class Api::V1::ProductInvestDetailsController < ApplicationController
  # before_action :authenticate_user
  before_action :find_proinvdetail, only: [:show]

  def show
    if @proinvdetail.present?
      render json: {
        status: 'OK', results: @proinvdetail.as_json(include: %i[product_invest product]),
        error: nil
      }, status: :ok
    else
      render json: {
        status: 'FAIL', results: nil, error: 'Data not found'
      }, status: :unprocessable_entity
    end
  end

  private

  def find_proinvdetail
    @proinvdetail = ProductInvestDetail.find_by(id: params[:id])
  end

  def proinvdetail_params
    params.require(:proinvdetail).permit(:description, :period, :return_value, :share_periode, :background)
  end
end
