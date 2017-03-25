class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = current_user.comments.create(create_comment)
    @comments = comment.prototype.comments
  end

  private
  def create_comment
    params.require(:comment).permit(:content).merge(prototype_id: params[:prototype_id])
  end
end
