class Api::V1::InvestorDetailsController < ApplicationController
  before_action :authenticate_user, except: %i[create show]

  def index
    investor_details = InvestorDetail.all
    if investor_details.present?
      render json: {
        status: 'OK', results: investor_details, error: nil
      }, status: :ok
    else
      render json: {
        status: 'FAIL', results: nil, error: 'Data is Empty'
      }, status: :unprocessable_entity
    end
  end

  def show
    @investor_detail = InvestorDetail.find(params[:id])
    if @investor_detail.present?
      data = @investor_detail.as_json(include: %i[user user_investor])
      render json: { status: 'OK', results: data, errors: nil }, status: :ok
    else
      render json: { status: 'FAIL', results: nil,
                     errors: 'Data Not Found' },
             status: :not_found
    end
  end

  def create
    @investor_detail = InvestorDetail.new(investor_detail_params)
    if @investor_detail.save
      render json: { status: 'OK', results: @investor_detail, errors: nil },
             status: :created
    else
      render json: { status: 'FAIL', results: nil,
                     errors: 'Failed to create' },
             status: :unprocesable_entity
    end
  end

  private

  def find_investor_detail
    @investor_detail = InvestorDetail.find(id: params[:id])
  end

  def investor_detail_params
    params.permit(:user_investor_id, :id_card_number, :addres, :phone_number, :birth_date, :id_card_type, :income_resource, :salary_range)
  end
end
