class Article < ActiveRecord::Base
  validates :title, :content, presence: true
end
