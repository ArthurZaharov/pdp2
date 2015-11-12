require "rails_helper"

feature "Signed in user" do
  let(:user) { create :user, :confirmed }
  let!(:article) { create :article, user: user }

  let(:login_page) { Devise::Sessions::New.new }
  let(:article_page) { Articles::Show.new }

  before(:each) do
    login_page.load
    login_page.sign_in(user.email, "123456")
    article_page.load(id: article.id)
  end

  scenario "can create comment with valid data" do
    # expect { article_page.create_comment }.to change { Comment.count }.by(1)
  end

  scenario "can not create comment with invalid data" do
    # article_page.create_comment(content: ")
    # expect(article_page).to have_validation_error_alert
  end
end
