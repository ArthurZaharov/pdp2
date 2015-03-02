class ArticlesController < ApplicationController
  before_action :authenticate_user!

  expose(:article, attributes: :article_params)

  def index
  end

  def create
    if article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :user_id)
  end
end
