class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create

  expose(:comment, attributes: :comment_params)
  expose(:article) { comment.article }

  def create
    if comment.save
      redirect_to article, notice: 'Comment successfully created.'
    else
      render 'articles/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :article_id)
  end
end
