class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  # validates :title, presence: true
  # validates :image, presence: true
  # validates :matarial, presence: true
  # validates :body, presence: true
  # validates :comment, presence: true
  attachment :image
end
