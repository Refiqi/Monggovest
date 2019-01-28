# function to show enum in string
class Api::V1::EnumsController < ApplicationController
  # function to show enum in string for id_card_type
  def id_card_type
    id_card_type = InvestorDetail.id_card_types
    render json: {
      status: 'OK',
      results: id_card_type,
      error: nil
    }, status: :ok
  end

  # function to show enum in string for income_resources
  def income_resource
    income_resource = InvestorDetail.income_resources
    render json: {
      ststus: 'OK',
      results: income_resource,
      error: nil
    }, status: :ok
  end

  # function to show enum in string for salary_range
  def salary_range
    salary_range = InvestorDetail.salary_ranges
    render json: {
      ststus: 'OK',
      results: salary_range,
      error: nil
    }, status: :ok
  end
end
