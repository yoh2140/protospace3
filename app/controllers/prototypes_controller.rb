class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_prototype, only: [:edit, :destroy, :update]

  def index
  end

  def new
    @prototype = Prototype.new
  end

  def show
  end

  def create
    if current_user.prototypes.create(create_params)
      redirect_to :root, notice: "作成ができました。"
    else
      flash.now[:alert] = "作成に失敗しました。"
      render :new
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
    params.require(:prototype).permit(:title, :cach_copy, :concept)
  end
end
