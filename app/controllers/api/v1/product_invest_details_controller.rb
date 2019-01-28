class Api::V1::ProductInvestDetailsController < ApplicationController
  # before_action :authenticate_user
  before_action :find_proinvdetail, only: [:show]

  def index
    proinvdetails = ProductInvestDetail.all
    if proinvdetails.present?
      data = proinvdetails.as_json(include: %i[product product_invest 
                          province regional subdistrict pictures])
      render json: {
        status: 'OK', results: data, error: nil
      }, status: :ok
    else
      not_auth
    end
  end

  def show
    if @proinvdetail.present?
      popular
      data = @proinvdetail.as_json(include: %i[product product_invest 
      										province	regional subdistrict pictures])
      render json: {
        status: 'OK', results: data, error: nil
      },
             status: :ok
    else
      not_auth
    end
  end

  private

  def not_auth
    render json: {
      status: 'FAIL', results: nil, error: 'Data is Empty'
    }, status: :unprocessable_entity
  end

  def popular
    @proinvdetail.count_view += 1
    @proinvdetail.save
  end

  def find_proinvdetail
    @proinvdetail = ProductInvestDetail.find_by(id: params[:id])
  end

  def proinvdetail_params
    params.require(:proinvdetail).permit(:description, :period, :return_value,
                                         :share_periode, :background,
                                         :count_view)
  end
end
