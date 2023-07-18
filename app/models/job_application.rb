# app/models/job_application.rb
class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :job_offer
  
  validates :cover_letter, presence: true
end
