module UsersHelper
  # 渡されたユーザーのGravatar画像を返す
  # def gravatar_for(user, options = { size: 80 })
  #   size         = options[:size]
  #   gravatar_id  = Digest::MD5::hexdigest(user.email.downcase)
  #   gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  #   image_tag(gravatar_url, alt: user.name, class: "gravatar")
  # end

  # ユーザー表示用のリサイズ済み画像を返す
  def display_avatar(avatar)
    avatar.variant(resize_to_limit: [100, 100])
  end

  # 投稿表示用のリサイズ済み画像を返す
  def post_image(image)
    image.variant(resize_to_limit: [500, 500])
  end
  
end
