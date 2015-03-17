class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i(new create edit update)
  before_action :validate_user, only: %i(edit update)

  expose(:articles)
  expose(:article, attributes: :article_params)
  expose(:comment) { article.comments.build }

  def create
    if article.save
      redirect_to articles_path, notice: 'Article successfully created!'
    else
      render :new
    end
  end

  def update
    if article.save
      redirect_to article, notice: 'Article successfully updated!'
    else
      render :edit
    end
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
