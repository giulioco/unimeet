class Activity < ActiveRecord::Base
  has_many :likes, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :matches, dependent: :destroy
  has_one :chatroom, dependent: :destroy
  #attr_accessible :name, :description, :max_size
  #validates :name, :max_size => true
  validates :name, :description, :max_size, :presence => true
  validates_length_of :description, :maximum => 700

  has_attached_file :image, styles: { medium: "300x300#", thumb: "50x50#" }, default_url: ":style/activity_avatar.png"
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
  #has_many :members
  def self.queue(user_id)
    member_of = Activity.joins(:memberships).where(memberships: {user_id: user_id})
    already_liked = Activity.joins(:likes).where(likes: {user_id: user_id, user_likes_activity: [true, false]})
    #reached_capacity = Activity.where('max_size = team_count')
    where.not(id: member_of).where.not(id: already_liked)
  end
end
