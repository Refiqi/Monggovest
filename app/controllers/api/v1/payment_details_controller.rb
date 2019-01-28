class Api::V1::PaymentDetailsController < ApplicationController
  # before_action :authenticate_user
  # skip_before_action :verify_authenticity_token
  before_action :find_paymentdetail, only: %i[show update]

  # function to show all data in feature/paymentdetail
  def index
    @paydetail = PaymentDetail.all
    if @paydetail.present?
      # payd = PaymentDetail.new
      # @date = payd.card_valid_date
      # @date.strptime('%Y-%m')
      render json: {
        status: 'OK',
         results: @paydetail,
         errors: nil
      }, status: :ok
    else
      render json: { status: 'FAIL', results: nil,
                      errors: 'there is no payment to show' },
              status: :unprocesable_entity
    end
  end

  # function to show data by id in feature/paymentdetail
  def show
    @paydetail = PaymentDetail.find_by(id: params[:id])
    if @paydetail.present?
      # data = @paydetail.as_json(include: %i[user_investor product_invest product])
      render json: {
        status: 'OK',
        results: @paydetail,
        error: nil
      }, status: :ok
    else
      render json: { status: 'FAIL', results: nil,
                      errors: 'payment does not exist' },
              status: :unprocesable_entity
    end
  end

  # function to update data in feature/investordetail
  def update
    @paydetail = PaymentDetail.find(params[:id])
    @paydetail_update = @paydetail.update(payment_details_params)
    if @paydetail_update
      render json: { status: 'OK', results: @paydetail_update, errors: nil },
             status: :ok
    else
      render json: { status: 'FAIL', results: nil,
                      errors: 'update payment details failed' },
              status: :unprocesable_entity
    end
  end

  # function to create data in feature/paymentdetal
  def create
    # if current_user
      # render json: { status: 200, msg: "Logged-in as #{current_user.name}" }
      @paydetail = PaymentDetail.new(payment_details_params)
      if @paydetail.save
        # @paydetail.card_valid_date.parse(strptime('%Y-%m'))
        render json: { status: 'OK', results: @paydetail, error: nil }, status: :created
      else
        render json: { status: 'FAIL', results: nil, error: @paydetail.errors }, status: :unprocessable_entity
      end
    # end
  end

  # function to call enum
  def payment_method
    payment_methods = PaymentDetail.payment_methods
    render json: {
            status:"OK",
            results: payment_methods,
            error: nil
        }, status: :ok
  end

  private

  # function to find data by id
  def find_paymentdetail
    @paydetail = PaymentDetail.find_by(id: params[:id])
  end

  # function to callback if params is invalid
  # def not_good
  #   render json: { status: 'FAIL', message: 'failed' }
  # end

  # function to whitelist params
  def payment_details_params
    params.permit(:user_investor_id, :payment_method, :card_number,
                    :receipt, :card_holder_name, :card_valid_date, :cvv, :isPaid)
  end
end
