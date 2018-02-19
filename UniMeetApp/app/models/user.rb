class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :interests, dependent: :destroy

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
  def interest_list
    interests.collect { |i| i.interest_name }.join(', ')
  end

  def interest_list=(text)
    if id && text
      interests.destroy_all
      text.split(',').each do |i|
        interests.create(interest_name: i.strip.capitalize)
      end
    end
  end

  validates :first_name, :last_name, :presence => true
  validates :first_name, :last_name, format: { with: /\A^[A-Za-z ,.'-]+$\z/, on: :create }
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@ucsc\.edu\z/,
                  message: "must be a ucsc.edu email" }
end
