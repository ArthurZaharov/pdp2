class ArticlePresenter < BasePresenter
  include ActionView::Helpers::TextHelper

  attr_reader :article

  delegate :id, :title, to: :@article

  def initialize(article)
    @article = article
  end

  def content
    simple_format(@article.content)
  end

  def unwrap
    article
  end
end
