class NewestsController < ApplicationController
  def index
    @prototypes = Prototype.includes(:user).order("created_at DESC").page(params[:page])
  end
end
