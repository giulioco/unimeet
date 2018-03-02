class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :interests, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :matches, dependent: :destroy
  has_many :activities, through: :memberships, dependent: :destroy

  has_attached_file :image, styles: { medium: "300x300#", thumb: "50x50#" }, default_url: ":style/user_avatar.png"
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
  
  def update_with_password(params={})
    current_password = params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end 

    result = if params[:password].blank? || valid_password?(current_password) 
      update_attributes(params)
    else
      self.attributes = params
      self.valid?
      self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      false
    end 

    clean_up_passwords
    result
  end
  def like_activity!(activity)
    itsMatch = false
    if self.likes.exists?(user_id: self.id, activity_id: activity.id)
      like = self.likes.find_by(user_id: self.id, activity_id: activity.id)
      like.update(user_likes_activity: true) 
       if like.user_likes_activity
        itsMatch = true
        if not self.matches.exists?(user_id: self.id, activity_id: activity.id)
          self.matches.create!(user_id: self.id, activity_id: activity.id)
          #it's a match!

      end
      end
    else self.likes.create!(user_id: self.id, activity_id: activity.id, user_likes_activity: true)
    end
    return itsMatch
  end

#there's never going to be a match through dislike activity
  def dislike_activity!(activity)
    if self.likes.exists?(user_id: self.id, activity_id: activity.id)
      self.likes.update(user_id: self.id, activity_id: activity.id, user_likes_activity: false) 
    else self.likes.create!(user_id: self.id, activity_id: activity.id, user_likes_activity: false)
    end
  end

  def like_profile!(profile, activity)
    if activity.likes.exists?(user_id: profile.id, activity_id: activity.id)
      like = activity.likes.find_by(user_id: profile.id, activity_id: activity.id)
      like.update(activity_likes_user: true) 
      if like.user_likes_activity
        if not activity.matches.exists?(user_id: profile.id, activity_id: activity.id)
          #it's a new match!
          activity.matches.create!(user_id: profile.id, activity_id: activity.id)
      end
      end
    else activity.likes.create!(user_id: profile.id, activity_id: activity.id, activity_likes_user: true)
    end
  end

  def dislike_profile!(profile, activity)
    if activity.likes.exists?(user_id: profile.id, activity_id: activity.id)
      activity.likes.update(user_id: profile.id, activity_id: activity.id, activity_likes_user: false) 
    else activity.likes.create!(user_id: profile.id, activity_id: activity.id, activity_likes_user: false)
    end
  end

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
