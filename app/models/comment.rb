class Comment < ActiveRecord::Base
  validates :content, presence: true, uniqueness: true

  belongs_to :user
  belongs_to :article
end
