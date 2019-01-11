class PagesController < ApplicationController
  before_action :authenticate_user!
  def show
    render template: "pages/#{params[:page]}"
  end
end
