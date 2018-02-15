class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :birthday, :presence => true
  validates :first_name, :middle_name, :last_name, format: { with: /\A^[A-Za-z ,.'-]+$\z/, on: :create }
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@ucsc\.edu\z/,
                  message: "must be a ucsc.edu email" }
end
