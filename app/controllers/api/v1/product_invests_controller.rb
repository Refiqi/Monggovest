class Api::V1::ProductInvestsController < ApplicationController
  # before_action :authenticate_user
  before_action :find_prodinvest, only: %i[destroy show]

  def index
    prodinvests = ProductInvest.all
    if prodinvests.present?
      render json: {
        status: 'OK', results: prodinvests.as_json(include: %i[product kecamatan]),
        error: nil
      }, status: :ok
    else
      render json: {
        status: 'FAIL', results: nil, error: 'Data is Empty'
      }, status: :unprocessable_entity
    end
  end

  def show
    if @prodinvest.present?
      @prodinvest.count_view += 1
      @prodinvest.save
      render json: {
        status: 'OK', results: @prodinvest, error: nil
      }, status: :ok
    else
      render json: {
        status: 'FAIL', results: nil, error: 'Data not found'
      }, status: :unprocessable_entity
    end
  end

  private

  def find_prodinvest
    @prodinvest = ProductInvest.find_by(id: params[:id])
  end

  def prodinvest_params
    params.require(:prodinvest).permit(:price, :slot, :count_view)
  end
end
