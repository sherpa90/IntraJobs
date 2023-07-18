class JobApplicationsController < ApplicationController
  def create
    @job_offer = JobOffer.find(params[:job_offer_id])
    @job_application = @job_offer.job_applications.build(user: current_user)

    if @job_application.save
      redirect_to user_job_applications_path(current_user), notice: "Has realizado la postulación exitosamente."
    else
      render :new
    end
  end
  
  def index
    @job_applications = current_user.job_applications
  end


  def new
    @job_offer = JobOffer.find(params[:job_offer_id])
    @job_application = @job_offer.job_applications.build
  end
  
  
  
  def show
    @job_applications = JobApplication.where(job_offer_id: params[:id])
  end
  

  private

  def create_notification(job_offer)
    message = "Nueva solicitud de empleo: #{job_offer.title}"
    Notification.create(user: job_offer.user, message: message)
  end



  

  def job_application_params
    params.require(:job_application).permit(:job_offer_id)
  end
  
end