class Activity < ActiveRecord::Base
  has_many :likes, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  #attr_accessible :name, :description, :max_size
  #validates :name, :max_size => true
  validates :name, :description, :max_size, :presence => true

  has_attached_file :image, styles: { medium: "300x300#", thumb: "50x50#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  #has_many :members
end