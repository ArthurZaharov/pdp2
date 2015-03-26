class CommentPresenter < ApplicationPresenter
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::DateHelper

  attr_reader :comment

  delegate :id, to: :comment

  def initialize(comment)
    @comment = comment
  end

  def content
    simple_format(comment.content)
  end

  def posted_by
    I18n.t('app.comment.posted_by',
           username: comment.user.full_name,
           time_ago: time_ago_in_words(comment.created_at))
  end

  def user_avatar_url
    "http://gravatar.com/avatar/#{Digest::MD5.hexdigest(comment.user.email).downcase}.png"
  end
end
