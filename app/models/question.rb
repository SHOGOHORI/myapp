class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true, length: { maximum: 300 }
  has_one_attached :image
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                       message: "有効な画像を投稿してください。" },
                                       size:         { less_than: 5.megabytes,
                                       message: "5MB以下の画像を投稿してください。" }

end
