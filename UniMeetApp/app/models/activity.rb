class Activity < ActiveRecord::Base
  belongs_to :user, :optional => true
  #attr_accessible :name, :description, :max_size
  #validates :name, :max_size => true
  #has_many :members
end