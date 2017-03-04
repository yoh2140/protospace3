class UsersController < ApplicationController
  before_action :set_user, only: [:index, :edit, :show]

  def index
  end

  def edit
  end

  def show
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

end
