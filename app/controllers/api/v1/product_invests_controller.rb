class Api::V1::ProductInvestsController < ApplicationController
  def index
    prodinvests = ProductInvest.all
    if prodinvests.present?
      data = prodinvests.as_json(include: %i[product subdistrict
                                    regional province pictures])
      render json: {
        status: 'OK', results: data, error: nil
      }, status: :ok
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

  def prodinvest_params
    params.require(:prodinvest).permit(:price, :slot)
  end

  def find_prodinvest
    @prodinvest = ProductInvest.find_by(id: params[:id])
  end
end
