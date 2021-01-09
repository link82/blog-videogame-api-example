class Api::UsersController < ApplicationController
  before_action :load_user, only: [:show, :update, :destroy]

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { error: 'Unable to register your profile' }, status: 422
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: { error: 'Unable to update your profile' }, status: 422
    end
  end

  def destroy
    if @user.destroy
      head :ok
    else
      render json: { error: 'Unable to delete your profile' }, status: 400
    end
  end

  private

  def load_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
