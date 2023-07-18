Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  resources :job_offers do
    resources :job_applications, only: [:new, :create]
  end
  
  root "job_offers#index"
end
