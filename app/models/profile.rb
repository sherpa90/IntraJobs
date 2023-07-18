# app/models/profile.rb
class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :bio, length: { maximum: 500 }
end
