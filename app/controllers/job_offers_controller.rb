class JobOffersController < ApplicationController
    def index
      @job_offers = JobOffer.all
    end
  
    def show
      @job_offer = JobOffer.find(params[:id])
    end
  
    def new
      @job_offer = JobOffer.new
    end
  
    def create
      @job_offer = JobOffer.new(job_offer_params)
      if @job_offer.save
        redirect_to job_offer_path(@job_offer), notice: 'Oferta laboral creada exitosamente'
      else
        render :new
      end
    end
  
    private
  
    def job_offer_params
      params.require(:job_offer).permit(:title, :description)
    end
  end
  