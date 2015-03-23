class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create

  respond_to :js, :html, :json

  expose(:comment, attributes: :comment_params)
  expose(:article) { comment.article }

  def create
    flash.now[:notice] = 'Comment successfully created.' if comment.save
    respond_with comment
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :article_id)
  end
end
