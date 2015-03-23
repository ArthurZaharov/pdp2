class ArticlePresenter < BasePresenter
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::DateHelper

  attr_reader :article

  delegate :id, :title, to: :@article

  def initialize(article)
    @article = article
  end

  def content
    simple_format(@article.content)
  end

  def author
    "#{@article.user.full_name} posted #{time_ago_in_words(@article.created_at)} ago"
  end

  def comments
    CommentPresenter.wrap(@article.comments)
  end

  def unwrap
    article
  end
end
