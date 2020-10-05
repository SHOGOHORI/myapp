class Question < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true, length: { maximum: 300 }
end
