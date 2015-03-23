class CommentPresenter < BasePresenter
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::DateHelper

  attr_reader :comment

  delegate :id, to: :@comment

  def initialize(comment)
    @comment = comment
  end

  def content
    simple_format(@comment.content)
  end

  def author
    I18n.t('app.comment.author',
           username: @comment.user.full_name,
           time_ago: time_ago_in_words(@comment.created_at))
  end

  def user_avatar
    gravatar_id = Digest::MD5.hexdigest(@comment.user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end
end
