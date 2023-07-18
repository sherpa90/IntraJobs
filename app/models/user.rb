# app/models/user.rb
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :job_applications
  has_many :job_offers, dependent: :destroy

  def admin?
    admin
  end

  private

  def create_profile
    Profile.create(user: self)
  end
  
  
  
end
