class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :messages, dependent: :destroy
  # has_many :messages,dependent: :destroy
  def already_liked?(post)
  self.likes.exists?(post_id: post.id)
    end
  delegate :name, to: :profile
end
