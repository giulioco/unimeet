class Like < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  validates :user_id, uniqueness: { scope: :activity_id }
end
