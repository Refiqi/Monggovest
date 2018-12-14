class Api::V1::UserInvestorsController < ApplicationController
  

  def new
    @userin = UserInvestor.new
  end

  def index
    @userin = UserInvestor.all
    if @userin.present?
      render json: {
        status: 'OK', results: @userin, errors: nil
      }, status: :ok
    else
      render json: { status: 'FAILED', results: nil,
                     errors: 'there is no users to show' },
             status: :unprocesable_entity
    end
  end

  def show
    @userin = UserInvestor.find(params[:id])
    if @userin.present?
      data = @userin.as_json(include: %i[product product_invest])
      render json: { status: 'OK', results: data, errors: nil }, status: :ok
    else
      render json: { status: 'FAILED', results: nil,
                     errors: 'user does not exist' },
             status: :not_found
    end
  end

  def update
    @userin = UserInvestor.find(params[:id])
    update_userin = @userin.update(userin_params)
    if update_userin
      render json: { status: 'OK', results: update_userin, errors: nil },
             status: :ok
    else
      render json: { status: 'FAILED', results: nil,
                     errors: 'update user failed' },
             status: :unprocesable_entity
    end
  end

  def create
    @userin = UserInvestor.new(userin_params)
    if @userin.save
      render json: { status: 'OK', results: @userin, errors: nil },
             status: :created
    else
      render json: { status: 'FAILED', results: nil,
                     errors: 'failed to create user' },
             status: :unprocesable_entity
    end
  end

  def destroy
    @userin = UserInvestor.find(params[:id])
    if @userin.destroy
      render json: { status: 'OK', results: 'user investor has been deleted',
                     errors: nil }, status: :ok
    else
      render json: { status: 'FAILED', results: nil,
                     errors: 'user failed to delete' },
             status: :unprocesable_entity
    end
  end

  private

  def userin_params
    params.permit(:user_id, :product_invests_id, :investor_slot,
                  :investor_pay, :invest_year)
  end
end
