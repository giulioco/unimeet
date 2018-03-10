class Chatroom < ApplicationRecord
	has_many :messages, dependent: :destroy
  	belongs_to :activity
  	has_many :users, through: :activity
  	validates :activity_id, presence: true, uniqueness: true

end
