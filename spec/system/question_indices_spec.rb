require 'rails_helper'

RSpec.describe "QuestionIndices", type: :system do
  scenario '質問一覧' do
    user = create(:user)
    question = create(:question, user_id: user.id)
    orange = create(:orange, user_id: user.id)
    most_recent = create(:most_recent, user_id: user.id)
    log_in_as(user)
    visit questions_path
    expect(page).to have_link user.name, href: user_path(user)
  end
end
