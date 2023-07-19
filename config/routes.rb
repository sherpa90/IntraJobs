Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users do
    resources :job_applications, only: [:index]
  end

  resources :job_applications, only: [:index]

  resources :job_offers do
    resources :job_applications, only: [:new, :create, :index]
  end

  resources :notifications, only: [:index]

  root "job_offers#index"
end
