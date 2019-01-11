class Api::V1::ProvincesController < ApplicationController
  protect_from_forgery with: :null_session
  protect_from_forgery with: :null_session

  def index
    provinces = Province.all
    if provinces.present?
      render json: {
        status: 'OK', results: provinces, error: nil
      }, status: :ok
    else
      render json: {
        status: 'FAIL', results: nil, error: 'Data is empty'
      }, status: :unprocessable_entity
    end
  end

  def show
    @prov = Province.find(params[:id])

    if @prov.present?
      render json: {
        status: 'OK', results: @prov
      }, status: :ok
    else
      render json: {
        status: 'FAIL', results: nil, error: 'Data is empty'
      }, status: :unprocessable_entity
    end
  end

  # find the province by id
  def find_prov
    @prov = Province.find_by(id: params[:id])
  end

  def prov_params
    params.permit(:name)
  end
end
