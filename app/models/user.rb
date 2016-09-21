class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :foods
  has_many :activities
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
