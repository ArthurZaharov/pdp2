require "rails_helper"

feature "Guest user" do
  let(:article) { create :article }
  let!(:comment) { create :comment, article: article }

  let(:article_page) { Articles::Show.new }

  before(:each) do
    article_page.load(id: article.id)
  end

  scenario "can view comments" do
    expect(article_page).to have_text comment.content
  end

  scenario "does not see create comment form" do
    expect(article_page).to_not have_create_comment_button
  end
end
