class Api::V1::PaymentDetailsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_paymentdetail, only: %i[show update]

  def index
    @paydetail = PaymentDetail.all
    if @paydetail.present?
      render json: @paydetail, status: :ok
    else
      render json: { message_error: 'PaymentDetails not found' }, status: :error
    end
  end

  def show
    if @paydetail.present?
      render json: @paydetail, status: :ok
    else
      render json: { message_error: 'PaymentDetails not found' }, status: :failed
    end
  end

  def update
    if @paydetail.update(payment_details_params)
      render json: { status: 'OK', msg: 'Payment Detail have been updated', error: 'nil'}
    else
      not_good
    end
  end

  def create
    @paydetail = PaymentDetail.new(payment_details_params)
    if @paydetail.save
      render json: { message: 'success to insert' }, status: :created
    else
      render json: { message: 'failed inserted' }, status: :unprocessable_entity
    end
  end

  private

  def find_paymentdetail
    @paydetail = PaymentDetail.find_by(id: params[:id])
  end

  def not_good
    render json: { message: 'failed' }
  end

  def payment_details_params
    params.require(:paymentdetail).permit(:card_number, :card_valid_date, :cvv, :isPaid)
  end
end
