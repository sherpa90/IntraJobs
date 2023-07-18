Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  resources :job_offers
  
  root "job_offers#index"
end
