class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i(new create edit update)
  before_action :validate_user, only: %i(edit update)

  respond_to :html, :json

  expose(:articles) { Article.includes(:user).page(params[:page]) }
  expose(:article, attributes: :article_params)
  expose(:comment) { article.comments.build }
  expose(:comments) { article.comments.includes(:user) }
  expose(:articles_presenter) { ArticlePresenter.wrap(articles) }
  expose(:article_presenter) { ArticlePresenter.wrap(article) }
  expose(:comments_presenter) { CommentPresenter.wrap(comments) }

  def create
    flash[:notice] = 'Article successfully created!' if article.save
    respond_with article
  end

  def update
    flash[:notice] = 'Article successfully updated!' if article.save
    respond_with article
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :user_id)
  end

  def validate_user
    return if article.user == current_user
    redirect_to article_path(article), alert: 'Access denied.'
  end
end
