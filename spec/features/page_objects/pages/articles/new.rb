module Articles
  class New < SitePrism::Page
    include FactoryGirl::Syntax::Methods
    include Formulaic::Dsl

    set_url '/articles/new'

    section :top_bar, TopBar, '.top-bar'

    element :new_article_button, 'input[value="Create Article"]'
    element :validation_error_alert, '.error', text: "can't be blank"
    element :require_sign_in_alert,
            '.alert',
            text: 'You need to sign in or sign up before continuing.'

    def create(options = {})
      fill_form(
        :article,
        attributes_for(:article).merge(options)
      )

      new_article_button.click
    end
  end
end
