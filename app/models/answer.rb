class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  scope :recently, -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :content, presence: true
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "有効な画像を投稿してください。" },
                                      size:         { less_than: 5.megabytes,
                                      message: "5MB以下の画像を投稿してください。" }
  has_one_attached :image
end
