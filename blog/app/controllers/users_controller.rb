class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to edit_user_registration_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :role)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
