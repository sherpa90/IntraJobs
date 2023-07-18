# app/models/job_offer.rb
class JobOffer < ApplicationRecord
  belongs_to :user
  has_many :job_applications
end
