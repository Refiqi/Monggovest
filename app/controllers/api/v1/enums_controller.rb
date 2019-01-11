class Api::V1::EnumsController < ApplicationController
  def id_card_type
    id_card_type = InvestorDetail.id_card_types
    render json: {
      status: 'OK',
      results: id_card_type,
      error: nil
    }, status: :ok
  end

  def income_resource
    income_resource = InvestorDetail.income_resources
    render json: {
      ststus: 'OK',
      results: income_resource,
      error: nil
    }, status: :ok
  end

  def salary_range
    salary_range = InvestorDetail.salary_ranges
    render json: {
      ststus: 'OK',
      results: salary_range,
      error: nil
    }, status: :ok
  end
end
