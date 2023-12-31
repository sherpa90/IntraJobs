class JobOffersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  
  def index
    @job_offers = JobOffer.includes(:user).all
    @job_offer = JobOffer.new # o cualquier lógica adicional necesaria para definir @job_offer
  end
  

  def show
    @job_offer = JobOffer.find(params[:id])
    @job_applications = @job_offer.job_applications
  end

  def new
    @job_offer = JobOffer.new
  end

  def create
    @job_offer = JobOffer.new(job_offer_params.merge(user: current_user))
  
    if @job_offer.save
      redirect_to @job_offer, notice: "Oferta laboral creada exitosamente."
    else
      render :new
    end
  end

  private

  def job_offer_params
    params.require(:job_offer).permit(:title, :description)
  end
end
