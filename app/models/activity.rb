class Activity < ActiveRecord::Base
  validates :name, :calories, :presence => true
  belongs_to :user
end
