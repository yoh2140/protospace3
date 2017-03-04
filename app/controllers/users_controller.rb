class UsersController < ApplicationController
  before_action :set_user, only: [:update, :edit, :show]

  def update
      if @user.update(update_params)
        redirect_to :root
      else
        render :edit
      end
  end

  def edit
  end

  def show
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def update_params
    params.require(:user).permit(:username, :email, :password, :member, :profile, :works, :avatar)
  end
end
