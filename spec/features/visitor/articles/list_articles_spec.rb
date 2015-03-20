require 'rails_helper'

feature 'Articles page' do
  let(:articles_page) { Articles::Index.new }

  let!(:article) { create :article }
  let!(:other_article) { create :article }

  before(:each) do
    articles_page.load
  end

  scenario 'does not have notice massages' do
    expect(articles_page).to_not have_create_successful_notice
  end

  scenario 'contains first article' do
    expect(articles_page).to have_text article.title
    expect(articles_page).to have_text article.content
  end

  scenario 'contains second article' do
    expect(articles_page).to have_text other_article.title
    expect(articles_page).to have_text other_article.content
  end

  scenario 'contains properly links to articles' do
    expect(articles_page).to have_link article.title, href: article_path(article)
    expect(articles_page).to have_link other_article.title, href: article_path(other_article)
  end
end
