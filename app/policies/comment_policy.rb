class CommentPolicy < BasePolicy
  def create?
    user
  end

  alias_method :new?, :create?
end
