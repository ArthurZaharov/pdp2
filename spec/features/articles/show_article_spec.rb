require 'rails_helper'

feature 'Article page' do
  let!(:user) { create :user, :confirmed }
  let!(:article) { create :article, user: user }
  let!(:other_article) { create :article }

  let(:article_page) { Articles::Show.new }

  context 'for not sign in user' do
    before do
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

  context 'for sign in user' do
    let(:login_page) { Devise::Sessions::New.new }

    before do
      login_page.load
      login_page.sign_in(user.email, '123456')
      article_page.load(id: article.id)
    end

    scenario 'have edit link for owned article' do
      expect(article_page).to have_edit_article_link
    end

    scenario 'does not have edit link for other article' do
      article_page.load(id: other_article.id)
      expect(article_page).to_not have_edit_article_link
    end

    scenario 'have add comment button' do
      expect(article_page).to have_create_comment_button
    end
  end
end
