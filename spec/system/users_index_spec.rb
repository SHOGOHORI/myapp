require 'rails_helper'

RSpec.describe "UsersIndices", type: :system do
  scenario '権限なしユーザーのユーザー一覧' do
    user = create(:user)
    log_in_as(user)
    visit users_path
    expect(page).to_not have_link '削除'
  end

  scenario '権限ありユーザーのユーザー一覧とユーザーの削除' do
    admin_user = create(:user, :admin_user)
    create_list(:user, 40)
    log_in_as(admin_user)
    visit users_path
    expect(html).to include 'pagination'
    create_list(:user, 40)
    first_page_of_users = User.paginate(page: 1)
    first_page_of_users.each do |user|
      expect(page).to have_link user.name, href: user_path(user)
      unless user == admin_user
        expect(page).to have_link '削除', href: user_path(user)
      end
    end
  end
end
