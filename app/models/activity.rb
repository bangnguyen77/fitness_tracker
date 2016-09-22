class Activity < ActiveRecord::Base
  validates :name, :calories, :presence => true
  belongs_to :user

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
