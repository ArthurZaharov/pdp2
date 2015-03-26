class ApplicationPolicy
  attr_reader :user, :resource

  def initialize(user, resource)
    @user, @resource = user, resource
  end
end
