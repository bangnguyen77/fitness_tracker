class Food < ActiveRecord::Base
  validates :name, :calories, :presence => true
  belongs_to :user
end
