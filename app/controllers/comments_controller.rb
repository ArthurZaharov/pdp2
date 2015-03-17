class CommentsController < ApplicationController
  # before_action :authenticate_user!, only: %i(new create edit update)
  # before_action :validate_user, only: %i(edit update)

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

  # def validate_user
  #   return if article.user == current_user
  #   redirect_to article_path(article), alert: 'Access denied.'
  # end
end
