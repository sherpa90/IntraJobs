# app/controllers/job_applications_controller.rb
class JobApplicationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @job_offer = JobOffer.find(params[:job_offer_id])
    @job_application = JobApplication.new
  end

  def create
    @job_offer = JobOffer.find(params[:job_offer_id])
    @job_application = current_user.job_applications.build(job_application_params)
    @job_application.job_offer = @job_offer

    if @job_application.save
      redirect_to job_offer_path(@job_offer), notice: "¡Postulación creada exitosamente!"
    else
      render :new
    end
  end

  private

  def job_application_params
    params.require(:job_application).permit(:cover_letter)
  end
end
