class Article < ActiveRecord::Base
  validates :title, :content, :user, presence: true

  belongs_to :user
  has_many :comments

  scope :ordered, -> { order(created_at: :desc) }
end
