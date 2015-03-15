require 'rails_helper'

feature 'Edit article' do
  let!(:user) { create :user, :confirmed }
  let!(:article) { create :article, user: user }
  let!(:other_article) { create :article }

  let(:edit_article_page) { Articles::Edit.new }

  scenario 'not permitted for not sign in user' do
    edit_article_page.load(id: article.id)
    expect(edit_article_page).to have_require_sign_in_alert
  end

  context 'for sign in user' do
    let(:login_page) { Devise::Sessions::New.new }

    before(:each) do
      login_page.load
      login_page.sign_in(user.email, '123456')
      edit_article_page.load(id: article.id)
    end

    scenario 'does not update with invalid data' do
      edit_article_page.update(title: '')
      expect(edit_article_page).to have_validation_error_alert
    end

    scenario 'update with valid data' do
      edit_article_page.update(title: 'New title')
      article.reload
      expect(article.title).to eq 'New title'
    end

    scenario 'redirect to article after update' do
      edit_article_page.update(title: 'New title')
      expect(edit_article_page).to have_update_successful_notice
    end

    scenario 'not permitted for other article' do
      edit_article_page.load(id: other_article.id)
      expect(edit_article_page).to have_access_denied_alert
    end
  end
end
