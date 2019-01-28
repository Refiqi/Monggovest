class Api::V1::InvestorDetailsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  # before_action :authenticate_user, except: %i[create show]

  # function to show all data in feature/investordetail
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

  # function to show data by id in feature/investordetail
  def show
    @investor_detail = InvestorDetail.find(params[:id])
    if @investor_detail.present?
      data = @investor_detail.as_json(include: %i[user_investor product_invest product_invest_detail product])
      render json: { status: 'OK', results: data, errors: nil }, status: :ok
    else
      render json: { status: 'FAIL', results: nil,
                     errors: 'Data Not Found' },
             status: :not_found
    end
  end

  # function to create data in feature/investordetail
  def create
    @investor_detail = InvestorDetail.new(investor_detail_params)
    if @investor_detail.save
      data = @investor_detail.as_json(include: %i[user_investor product_invest product])
      render json: { status: 'OK', results: data, errors: nil },
             status: :created
    else
      render json: { status: 'FAIL', results: nil,
                     errors: 'Failed to create' },
             status: :unprocesable_entity
    end
  end

  private

  # function to find data by id in feature/investordetail
  def find_investor_detail
    @investor_detail_id = InvestorDetail.find(id: params[:id])
  end

  # function to whitelist params
  def investor_detail_params
    params.permit(:user_investor_id, :id_card_number, :addres, :phone_number, :birth_date, :id_card_type, :income_resource, :salary_range)
  end
end
