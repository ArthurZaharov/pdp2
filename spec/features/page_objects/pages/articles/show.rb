module Articles
  class Show < SitePrism::Page
    set_url '/articles{/id}'

    section :top_bar, TopBar, '.top-bar'

    element :edit_article_link, 'a.button', text: 'Edit'
  end
end
