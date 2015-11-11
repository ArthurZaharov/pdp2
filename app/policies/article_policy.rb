class ArticlePolicy < ApplicationPolicy
  def manage?
    user == record.user
  end
end
