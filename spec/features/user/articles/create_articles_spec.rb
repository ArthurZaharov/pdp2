require 'rails_helper'

feature 'Sign in user' do
  let(:user) { create :user, :confirmed }

  let(:login_page) { Devise::Sessions::New.new }
  let(:new_article_page) { Articles::New.new }
  let(:articles_page) { Articles::Index.new }

  before(:each) do
    login_page.load
    login_page.sign_in(user.email, '123456')
    new_article_page.load
  end

  scenario 'can create article with valid data' do
    expect { new_article_page.create }.to change { Article.count }.by(1)
  end

  scenario 'can not create article with invalid data' do
    new_article_page.create(title: '')
    expect(new_article_page).to have_validation_error_alert
  end

  scenario 'has create new article link' do
    expect(new_article_page.top_bar).to have_create_new_article_link
  end

  scenario 'redirected to articles path after create article with successful notice' do
    new_article_page.create
    expect(articles_page).to have_create_successful_notice
  end
end
