class UsersController < ApplicationController
    before_action :authorize
    skip_before_action :authorize, only: [:create]

  # POST /signup
  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    render json: user, status: :created
  end

  # GET /me
  def show
    user = User.find_by(id: session[:user_id])
    render json: user, status: :created
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation, :image_url, :bio)
  end
end