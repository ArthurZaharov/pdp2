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
    I18n.t('app.article.author',
           username: @article.user.full_name,
           time_ago: time_ago_in_words(@article.created_at))
  end

  def user_avatar
    gravatar_id = Digest::MD5.hexdigest(@article.user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end

  def comments
    CommentPresenter.wrap(@article.comments)
  end

  def unwrap
    article
  end
end
