class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_prototype, only: %i(show edit destroy update)

  def index
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def show
  end

  def create
    prototype = Prototype.new(create_params)
    if prototype.save
      flash.now[:success] = "作成が成功しました。"
      render 'index'
    else
      flash.now[:danger] = "作成が失敗しました。"
      render 'index'
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def create_params
    params.require(:prototype).permit(:title, :cach_copy, :concept, images_attributes: [:id, :content, :status]).merge(user_id: current_user.id)
  end
end
