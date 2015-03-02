require 'rails_helper'

feature 'Guest user' do
  let(:new_article_page) { Articles::New.new }

  before(:each) do
    new_article_page.load
  end

  scenario 'can not create article' do
    expect(new_article_page).to have_require_sign_in_alert
  end

  scenario 'has not create new article link' do
    expect(new_article_page.top_bar).to_not have_create_new_article_link
  end
end
