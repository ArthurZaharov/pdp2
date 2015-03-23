class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i(new create edit update)
  before_action :authorize!, only: %i(new create edit update)

  respond_to :html, :json

  expose(:articles) { Article.includes(:user).page(params[:page]) }
  expose(:article, attributes: :article_params)
  expose(:comment) { article.comments.build }
  expose(:comments) { article.comments.includes(:user) }
  expose(:articles_presenter) { ArticlePresenter.wrap(articles) }
  expose(:article_presenter) { ArticlePresenter.wrap(article) }
  expose(:comments_presenter) { CommentPresenter.wrap(comments) }

  def create
    flash[:notice] = I18n.t('app.article.creation_successful') if article.save
    respond_with article
  end

  def update
    flash[:notice] = I18n.t('app.article.update_successful') if article.save
    respond_with article
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :user_id)
  end

  def authorize!
    return if ArticlePolicy.new(current_user, article).send("#{action_name}?")
    redirect_to root_path, alert: 'Access denied.'
  end
end
