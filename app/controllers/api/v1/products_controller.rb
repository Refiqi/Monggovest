class Api::V1::ProductsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :find_product, only: %i[destroy show update]
  before_action :verify_authenticity_token, except: [:index]
  # method to create API to show all product from table
  def index
    @product = Product.all
    if @product.present?
      render json: { status: 'OK', results: @product.as_json(include: %i[pictures]), error: nil 
        }, status: :ok
    else
      render json: {
        status: 'FAIL', results: nil, error: 'Data is empty'
      }, status: :unprocessable_entity
    end
  end

  # method to show specific product
  def show
    @product = Product.find(params[:id])
    if @product.present?
      render json: {
        status: 'OK', results: @product.as_json(include: %i[pictures]), error: nil
      }, status: :ok
    else
      not_process
    end
  end

  # method to save new product
  def create
    product = Product.new(product_params)
    if product.save
      product.reload
      render json: {
        status: 'OK', results: product, error: nil
      }, status: :created
    else
      not_process
    end
  end

  # method to update product that have exist
  def update
    @product = Product.find(params[:id])
    update_product = @product.update(product_params)
    if update_product
      render json: {
        status: 'OK', results: update_product, error: nil
      }, status: :ok
    else
      not_auth
    end
  end

  # method to delete product base on id
  def destroy
    if @product == Product.find(params[:id])
      @product.destroy!
      render json: {
        status: 'OK', results: 'Delete success', error: nil
      }, status: :ok
    else
      not_process
    end
  end

  private

  def not_process
    render json: {
      status: 'FAIL', results: nil, error: 'Data fail to process'
    }, status: :unprocessable_entity
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.permit(:kecamatan_id, :product_type, :name, :photo)
  end
end
