module Articles
  class Show < SitePrism::Page
    set_url '/articles/{id}'

    section :top_bar, TopBar, '.top-bar'
  end
end
