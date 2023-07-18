# app/controllers/job_applications_controller.rb
class JobApplicationsController < ApplicationController
    before_action :set_job_offer, only: [:new, :create]
    
    def new
      @job_application = @job_offer.applications.build
    end
    
    def create
      @job_application = @job_offer.applications.build(job_application_params)
      
      if @job_application.save
        redirect_to @job_offer, notice: "Application submitted successfully."
      else
        render :new
      end
    end
    
    private
    
    def set_job_offer
      @job_offer = JobOffer.find(params[:job_offer_id])
    end
    
    def job_application_params
      params.require(:job_application).permit(:cover_letter).merge(user_id: current_user.id)
    end
  end
  