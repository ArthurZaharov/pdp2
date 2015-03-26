class ArticlePolicy < ApplicationPolicy
  def manage?
    user == resource.user
  end
end
