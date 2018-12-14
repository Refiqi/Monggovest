class Api::V1::PopularProductsController < ApplicationController
  before_action :set_popular, only: %i[show edit update destroy]

  def index
    @populars = ProductInvest.all.order('count_view DESC')
    if @populars.present?
      render json: {
        status: 'OK', result: @populars, error: nil
      }, status: :ok
    else
      render json: {
        status: 'FAIL', results: nil, error: 'Data is empty'
      }, status: :unprocessable_entity
    end
  end

  private

  def set_popular
    @popular = ProductInvest.find(params[:id])
  end

  def popular_params
    params.require(:popular).permit(:count_view)
  end
end
