module TestHelper
  # テストユーザーがログイン中の場合にtrueを返す
  def is_logged_in?
    !session[:user_id].nil?
  end

  # request用テストユーザーとしてログインする
  def sign_in(user = FactoryBot.create(:user))
    session[:user_id] = user.id
  end

  # feature用テストユーザーとしてログインする
  def log_in_as(user)
    visit login_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password
    check 'このコンピューターを記憶しますか？'
    click_button 'ログイン'
  end
end
