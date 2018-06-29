Rails.application.routes.draw do

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'

  root 'dashboard#home'  

  resources :templates do
    get 'preview', to: 'templates#preview'
  end

  resources :requests, only: [:index] do
    get 'download', to: 'requests#download'
    get 'mail', to: 'requests#mail'
  end
end
