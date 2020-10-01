module TestHelper

  # テストユーザーとしてログインする
  def log_in_as(user)
    visit login_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password
    check 'このコンピューターを記憶しますか？'
    click_button 'ログイン'
  end
end