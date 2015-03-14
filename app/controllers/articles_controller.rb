class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i(new create)

  expose(:articles)
  expose(:article, attributes: :article_params)

  def create
    if article.save
      redirect_to articles_path, notice: 'Article successfully created!'
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :user_id)
  end
end
