class ArticlePresenter < ApplicationPresenter
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::DateHelper

  attr_reader :article

  delegate :id, :title, to: :article

  def initialize(article)
    @article = article
  end

  def content
    simple_format(article.content)
  end

  def posted_by
    I18n.t('app.article.posted_by',
           username: article.user.full_name,
           time_ago: time_ago_in_words(article.created_at))
  end

  def user_avatar_url
    "http://gravatar.com/avatar/#{Digest::MD5.hexdigest(article.user.email).downcase}.png"
  end
end
