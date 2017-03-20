class UsersController < ApplicationController
  before_action :set_user, only: [:update, :edit, :show]
  before_action :authenticate_user!, only: [:update, :edit]

  def update
      if @user.update(update_params)
        redirect_to :root, notice: "変更が完了しました。"
      else
        flash.now[:alert] = "変更が失敗しました。"
        render :edit
      end
  end

  def edit
  end

  def show
    @prototypes = @user.prototypes.page(params[:page])
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def update_params
    params.require(:user).permit(:username, :email, :password, :member, :profile, :works, :avatar)
  end
end
