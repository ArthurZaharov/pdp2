module Articles
  class Index < SitePrism::Page
    set_url '/articles'

    section :top_bar, TopBar, '.top-bar'

    element :create_successful_notice, '.notice', text: 'Article successfully created!'
  end
end
