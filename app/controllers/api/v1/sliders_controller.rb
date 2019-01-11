class Api::V1::SlidersController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :verify_authenticity_token, except: [:index]
  before_action :find_slider, only: %i[destroy show update]

  # method to create API to show all slider from table
  def index
    sliders = Slider.where(:isActive => true)
    if sliders.present?
      render json: {
        status: 'OK', results: sliders, error: nil
      }, status: :ok
    else
      render json: {
        status: 'FAIL', results: nil, error: 'Data is empty'
      }, status: :unprocessable_entity
    end
  end

  # method to save new slider
  def create
    slider = Slider.new(slider_params)
    sliderall = Slider.all
    if sliderall.present?
      sliderlast = Slider.last
      sort_number = sliderlast.sort_number.to_i
      sort_numbers = sort_number + 1
    else
      sort_number = 0
      sort_numbers = sort_number + 1
    end
    if slider.save
      slider.update(sort_number: sort_numbers)
      slider.reload
      render json: { status: 'OK', results: slider, error: nil },
             status: :created
    else
      render json: {
        status: 'FAIL', results: nil, error: 'data fail created'
      }, status: :unprocessable_entity
    end
  end

  # method to show specific slider
  def show
    if @slider.present?
      render json: {
        status: 'OK', results: @slider, error: nil
      }, status: :ok
    else
      render json: {
        status: 'FAIL', results: nil, error: 'Data not found'
      }, status: :unprocessable_entity
    end
  end

  # method to update slider that have exist
  def update
    @slider = Slider.find(params[:id])
    @slider.image_url
    @slider.remove_image!
    update_slider = @slider.update(slider_params)
    if update_slider
      render json: { status: 'OK', results: update_slider, error: nil },
             status: :ok
    else
      render json: { status: 'FAIL', results: nil, error: 'Data fail to update' },
             status: :unprocessable_entity
    end
  end

  # method to delete slider base on id
  def destroy
    @slider = Slider.find(params[:id])
    if @slider.destroy!
      render json: {
        status: 'OK', results: 'Delete success', error: nil
      }, status: :ok
    else
      render json: {
        status: 'FAIL', results: nil, error: 'Delete fail'
      }
    end
  end

  private

  def find_slider
    @slider = Slider.find(params[:id])
  end

  def slider_params
    # params.require(:slider).permit(:name,
    # :image, :url, :sort_number, :isActive)
    params.permit(:name, :image, :url, :sort_number, :isActive)
  end
end
