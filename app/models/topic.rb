class Topic < ApplicationRecord
  belongs_to :user
  attachment :image
end
