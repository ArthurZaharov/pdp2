require 'rails_helper'

feature 'Main page' do
  let(:main_page) { Articles::Index.new }

  let!(:article) { create :article }
  let!(:other_article) { create :article }

  before(:each) do
    main_page.load
  end

  scenario 'contains first article' do
    expect(main_page).to have_text article.title
    expect(main_page).to have_text article.content
  end

  scenario 'contains second article' do
    expect(main_page).to have_text other_article.title
    expect(main_page).to have_text other_article.content
  end

  scenario 'contains properly links to articles' do
    expect(main_page).to have_link article.title, href: article_path(article)
    expect(main_page).to have_link other_article.title, href: article_path(other_article)
  end
end
