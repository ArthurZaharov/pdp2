module Articles
  class Edit < SitePrism::Page
    include FactoryGirl::Syntax::Methods
    include Formulaic::Dsl

    set_url '/articles{/id}/edit'

    section :top_bar, TopBar, '.top-bar'

    element :edit_article_button, 'input[value="Update Article"]'
    element :validation_error_alert, '.error', text: "can't be blank"
    element :access_denied_alert, '.alert', text: 'Access denied.'
    element :update_successful_notice, '.notice', text: 'Article successfully updated!'
    element :require_sign_in_alert,
            '.alert',
            text: 'You need to sign in or sign up before continuing.'

    def update(options = {})
      fill_form(
        :article,
        attributes_for(:article).slice(*article_attributes).merge(options)
      )

      edit_article_button.click
    end

    private

    def article_attributes
      %i(title content user_id)
    end
  end
end
