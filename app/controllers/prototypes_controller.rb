class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_prototype, only: %i(show edit destroy update)

  def index
    @prototypes = Prototype.includes(:user).order("created_at DESC")
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def show
  end

  def create
    @prototype = Prototype.new(create_params)
    if @prototype.save
      redirect_to :root, flash: {success: "作成できました。"}
    else
      flash[:danger] = "作成に失敗しました。"
      render "new"
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
