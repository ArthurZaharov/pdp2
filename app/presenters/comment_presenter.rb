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
    "#{@comment.user.full_name} posted #{time_ago_in_words(@comment.created_at)} ago"
  end

  def unwrap
    comment
  end
end
