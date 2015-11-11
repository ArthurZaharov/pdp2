class Article < ActiveRecord::Base
  validates :title, :content, :user, presence: true

  belongs_to :user
  has_many :comments

  default_scope { order(created_at: :desc) }

  def presenter
    @presenter ||= ArticlePresenter.wrap(self)
  end
end
