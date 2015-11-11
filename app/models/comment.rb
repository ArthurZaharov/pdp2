class Comment < ActiveRecord::Base
  validates :content, presence: true, uniqueness: true

  belongs_to :user
  belongs_to :article

  def presenter
    @presenter ||= CommentPresenter.wrap(self)
  end
end
