module UsersHelper
  # ユーザー表示用のリサイズ済み画像を返す
  def display_avatar(avatar)
    avatar.variant(resize_to_limit: [100, 100])
  end

  # 投稿表示用のリサイズ済み画像を返す
  def post_image(image)
    image.variant(resize_to_limit: [500, 500])
  end
  
end
