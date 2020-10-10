class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  # default_scope -> { order(created_at: :desc) }
  scope :recently, -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :content, presence: true
end
