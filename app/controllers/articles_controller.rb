class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i(new create edit update)
  before_action :authorize_user!, only: %i(edit update)

  respond_to :html

  expose(:articles) { Article.includes(:user).page(params[:page]) }
  expose(:article, attributes: :article_params)
  expose(:comment) { article.comments.build }
  expose(:comments) { article.comments.includes(:user) }

  def create
    article.user = current_user
    flash[:notice] = I18n.t("app.article.creation_successful") if article.save
    respond_with(article)
  end

  def update
    flash[:notice] = I18n.t("app.article.update_successful") if article.save
    respond_with(article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def authorize_user!
    return if ArticlePolicy.new(current_user, article).manage?
    redirect_to(root_url, alert: I18n.t("app.access_denied"))
  end
end
