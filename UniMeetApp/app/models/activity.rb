class Activity < ActiveRecord::Base
  has_many :likes, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :matches, dependent: :destroy
  #attr_accessible :name, :description, :max_size
  #validates :name, :max_size => true
  validates :name, :description, :max_size, :presence => true
  validates_length_of :description, :maximum => 700

  has_attached_file :image, styles: { medium: "300x300#", thumb: "50x50#" }, default_url: ":style/missing_avatar.png"
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
  #has_many :members
end