class Match < ApplicationRecord
	belongs_to :user
  	belongs_to :activity
  	validates :user_id, uniqueness: { scope: :activity_id }
  	validates :activity_id, uniqueness: { scope: :user_id }
end