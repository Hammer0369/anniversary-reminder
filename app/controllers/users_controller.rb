class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: :update

  def show
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end
end

private

def set_user
  @user = User.find(params[:id])
end

def user_params
  params.require(:user).permit(:name, :birth_date, :email)
end
