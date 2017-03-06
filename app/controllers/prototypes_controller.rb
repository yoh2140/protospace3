class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_prototype, only: [:edit, :destroy, :update]

  def index
  end

  def new
  end

  def show
  end

  def create
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
end
