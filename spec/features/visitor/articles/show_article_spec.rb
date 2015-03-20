require 'rails_helper'

feature 'Article page' do
  let!(:article) { create :article }

  let(:article_page) { Articles::Show.new }

  before(:each) do
    article_page.load(id: article.id)
  end

  scenario 'have title' do
    expect(article_page).to have_text article.title
  end

  scenario 'have content' do
    expect(article_page).to have_text article.content
  end

  scenario 'does not have edit link' do
    expect(article_page).to_not have_edit_article_link
  end

  scenario 'does not have add comment button' do
    expect(article_page).to_not have_create_comment_button
  end
end
