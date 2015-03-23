class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :authorize!, only: %i(new create)

  respond_to :js, :html, :json

  expose(:comment, attributes: :comment_params)

  def create
    comment.save
    respond_with comment
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :article_id)
  end

  def authorize!
    return if CommentPolicy.new(current_user, comment).send("#{action_name}?")
    redirect_to root_path, alert: 'Access denied.'
  end
end
