class PrototypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prototype, only: %i(show edit destroy update)

  def index
    @prototypes = Prototype.includes(:user).order("created_at DESC").page(params[:page])
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

  def edit
  end

  def update
    if @prototype.update(create_params)
      redirect_to ({action: :show}), flash: {success: "更新できました。"}
    else
      flash[:danger] = "更新が失敗しました。"
      render "edit"
    end
  end

  def destroy
    @prototype.destroy
    redirect_to :root, flash: { success: '削除が完了しました。' }
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def create_params
    params.require(:prototype).permit(:title, :cach_copy, :concept, images_attributes: [:id, :content, :status]).merge(user_id: current_user.id)
  end
end
