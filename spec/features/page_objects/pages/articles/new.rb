module Articles
  class New < SitePrism::Page
    include FactoryGirl::Syntax::Methods
    include Formulaic::Dsl

    set_url '/articles/new'

    section :top_bar, TopBar, '.top-bar'

    element :new_article_button, 'input[value="Create article"]'
    element :require_sign_in_alert,
            '.alert',
            text: 'You need to sign in or sign up before continuing.'

    def create
      fill_form(
        :article,
        attributes_for(:article).slice(*article_attributes)
      )

      new_article_button.click
    end

    private

    def article_attributes
      %i(title content user_id)
    end
  end
end
