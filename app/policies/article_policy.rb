class ArticlePolicy < BasePolicy
  def create?
    user
  end

  alias_method :new?, :create?

  def update?
    user && user.id == resource.user_id
  end

  alias_method :edit?, :update?
end
