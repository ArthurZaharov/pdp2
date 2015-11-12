require "rails_helper"

feature "Guest user" do
  let!(:article) { create :article }

  let(:edit_article_page) { Articles::Edit.new }

  scenario "can not edit article" do
    edit_article_page.load(id: article.id)
    expect(edit_article_page).to have_require_sign_in_alert
  end
end
