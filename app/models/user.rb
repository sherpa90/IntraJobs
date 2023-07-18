# app/models/user.rb
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile

  after_create :create_profile

  def admin?
    admin
  end

  private

  def create_profile
    Profile.create(user: self)
  end
  
  
  
end
