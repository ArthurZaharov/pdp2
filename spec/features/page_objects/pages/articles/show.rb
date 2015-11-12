module Articles
  class Show < SitePrism::Page
    include FactoryGirl::Syntax::Methods
    include Formulaic::Dsl

    set_url "/articles{/id}"

    section :top_bar, TopBar, ".top-bar"

    element :edit_article_link, "i.fi-pencil"
    element :create_comment_button, "input[value='Add Comment']"
    element :validation_error_alert, ".error", text: "can't be blank"

    def create_comment(options = {})
      fill_form(
        :comment,
        attributes_for(:comment).merge(options)
      )

      create_comment_button.click
    end
  end
end
