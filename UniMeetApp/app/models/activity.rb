class Activity < ActiveRecord::Base
  attr_accessible :name, :description, :max_size
  validates :name, :max_size => true

end