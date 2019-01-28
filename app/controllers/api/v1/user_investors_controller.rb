class Api::V1::UserInvestorsController < ApplicationController
  # before_action :authenticate_user

  # function to show all data in feature/userinvest
  def index
    @userin = UserInvestor.all
    if @userin.present?
      render json: {
        status: 'OK', results: @userin, errors: nil
      }, status: :ok
    else
      render json: { status: 'FAIL', results: nil,
                     errors: 'there is no users to show' },
             status: :unprocesable_entity
    end
  end

  # function to show data by id in feature/userinvest
  def show
    @userin = UserInvestor.find(params[:id])
    if @userin.present?
      data = @userin.as_json(include: %i[product_invest])
      render json: { status: 'OK', results: data, errors: nil }, status: :ok
    else
      render json: { status: 'FAIL', results: nil,
                     errors: 'user does not exist' },
             status: :not_found
    end
  end

  # function update data by id in feature/userinvest
  def update
    @userin = UserInvestor.find(params[:id])
    update_userin = @userin.update(userin_params)
    if update_userin
      render json: { status: 'OK', results: update_userin, errors: nil },
             status: :ok
    else
      render json: { status: 'FAIL', results: nil,
                     errors: 'update user failed' },
             status: :unprocesable_entity
    end
  end

  # function to create data in feature/userinvest
  def create
    if current_user
      # render json: { status: 200, msg: "Logged-in as #{current_user.name}" }
      @userin = UserInvestor.new(userin_params)
      if @userin.save
        render json: { status: 'OK', results: @userin, errors: nil },
              status: :created
      else
        render json: { status: 'FAIL', results: nil,
                      errors: 'failed to create user' },
              status: :unprocesable_entity
      end
    end
  end

  # function to delete data by id in feature/userinvest
  def destroy
    @userin = UserInvestor.find(params[:id])
    if @userin.destroy
      render json: { status: 'OK', results: 'user investor has been deleted',
                     errors: nil }, status: :ok
    else
      render json: { status: 'FAIL', results: nil,
                     errors: 'user failed to delete' },
             status: :unprocesable_entity
    end
  end

  private

  # function to whitelist params
  def userin_params
    params.permit(:user_id, :product_invest_id, :investor_slot,
                  :investor_pay, :invest_year, :created_at)
  end
end
