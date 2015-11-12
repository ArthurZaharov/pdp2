class ApplicationPresenter
  def self.wrap(object)
    if object.respond_to?(:map)
      object.map { |el| new(el) }
    else
      new(object)
    end
  end

  def initialize(object)
    @object = object
  end

  def content
    simple_format(@object.content)
  end

  def posted_by
    I18n.t("app.article.posted_by",
      username: @object.user.full_name,
      time_ago: time_ago_in_words(@object.created_at))
  end

  def user_avatar_url
    "http://gravatar.com/avatar/#{Digest::MD5.hexdigest(@object.user.email).downcase}.png"
  end
end
